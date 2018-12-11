//
//  SwiftyJSON.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/21.
//  Copyright © 2018 lmg. All rights reserved.
//

import Foundation

// MARK: - Error
// swiftlint:disable line_length
public enum SwiftyJSONError: Int , Swift.Error{
    case unsupportedType = 999
    case indexOutOfBounds = 900
    case elementToDeep = 902
    case wrongType = 901
    case notExist = 500
    case invalidJSON = 490
}

extension SwiftyJSONError : CustomNSError {
    
    public static var errorDomain: String {
        return "com.swiftyjson.SwiftyJSON"
    }
    
    public var errorCode: Int{ return self.rawValue }
   
    public var errorUserInfo: [String : Any]{
        switch self {
        case .unsupportedType:
            return [NSLocalizedDescriptionKey: "It is an unsupported type."]
        case .indexOutOfBounds:
            return [NSLocalizedDescriptionKey: "Array Index is out of bounds."]
        case .elementToDeep:
            return [NSLocalizedDescriptionKey: "Element too deep. Increase maxObjectDepth and make sure there is no reference loop."]
        case .wrongType:
            return [NSLocalizedDescriptionKey: "Couldn't merge, because the JSONs differ in type on top level."]
        case .notExist:
            return [NSLocalizedDescriptionKey: "Dictionary key does not exist."]
        case .invalidJSON:
            return [NSLocalizedDescriptionKey: "JSON is invalid."]
        }
    }
    
}

// MARK: - JSON Type

/**
 JSON's type definitions.
 
 See http://www.json.org
 */

public enum Type: Int{
    case number
    case string
    case bool
    case array
    case dictionary
    case null
    case unknown
}

// MARK: - JSON Base

public struct JSON{
    
    public init(data:Data,options opt:JSONSerialization.ReadingOptions = []) throws{
        let object:Any = try JSONSerialization.jsonObject(with: data, options: opt)
        self.init(jsonObject: object)
    }
    
    public init(_ object:Any){
        switch object {
        case let object as Data:
            do{
                try self.init(data: object)
            }catch{
                self.init(jsonObject: NSNull())
            }
        default:
            self.init(jsonObject: object)
        }
    }
    
    public init(parseJson jsonString:String){
        if let data = jsonString.data(using: .utf8) {
            self.init(data)
        }else{
            self.init(NSNull())
        }
    }

    fileprivate init(jsonObject:Any) {
        self.object = jsonObject
    }
    
    /*
     Private woker function which does the actual merging
     Typecheck is set to true for the first recursion level to prevent total override of the source JSON
     */
    fileprivate mutating func merge(with other:JSON,typecheck:Bool) throws {
        if self.type == other.type {
            switch self.type{
            case .dictionary:
                for (key, _) in other {
                    try self[key].merge(with: other[key], typecheck: false)
                }

            case .array:
                self = JSON(self.arrayValue + other.arrayValue)

            default :
                self = other
            }
        }else{
            if typecheck {
                throw SwiftyJSONError.wrongType
            }else{
                self = other
            }
        }
    }
    
    /// Private object
    fileprivate var rawArray: [Any] = []
    fileprivate var rawDictionary: [String: Any] = [:]
    fileprivate var rawString: String = ""
    fileprivate var rawNumber: NSNumber = 0
    fileprivate var rawNull: NSNull = NSNull()
    fileprivate var rawBool: Bool = false
    
    /// JSON type, fileprivate setter
    public fileprivate(set) var type:Type = .null
    
    /// Error in JSON, fileprivate setter
    public fileprivate(set) var error:SwiftyJSONError?
    
    public var object: Any{
        get{
            switch self.type {
            
            case .number:
                return self.rawNumber
            case .string:
                return self.rawString
            case .bool:
                return self.rawBool
            case .array:
                return self.rawArray
            case .dictionary:
                return self.rawDictionary
            default:
                return self.rawNull
            }
        }
        
        set{
            error = nil
            switch unwrap(newValue) {
            case let number as NSNumber:
                if number.isBool {
                    type = .bool
                    self.rawBool = number.boolValue
                }else{
                    type = .number
                    self.rawNumber = number
                }
            case let string as String :
                type = .string
                self.rawString = string
            case _ as NSNull:
                type = .null
            case nil:
                type = .null
            case let array as [Any]:
                type = .array
                self.rawArray = array
            case let dictionary as [String:Any]:
                type = .dictionary
                self.rawDictionary = dictionary
            default:
                type = .unknown
                error = SwiftyJSONError.unsupportedType
            }
        }
    }
    
    /// The static null JSON
    @available(*, unavailable, renamed:"null")
    public static var nullJSON:JSON {return null}
    public static var null: JSON { return JSON(NSNull()) }
    
}
/// Private method to unwarp an object recursively
private func unwrap(_ object:Any) -> Any {
    switch object {
    case let json as JSON:
        return unwrap(json.object)
    case let array as [Any]:
        return array.map(unwrap)
    case let dictionary as [String:Any]:
        var unwrappedDic = dictionary
        for (k,v) in dictionary{
            unwrappedDic[k] = unwrap(v)
        }
        return unwrappedDic
        
    default:
        return object
    }
}

private let trueNumber = NSNumber.init(value: true)
private let falseNumber = NSNumber.init(value: false)
private let trueObjCType = String(cString: trueNumber.objCType)
private let falseObjcType = String(cString: falseNumber.objCType)


extension NSNumber {
    fileprivate var isBool:Bool {
        let objCType = String(cString: self.objCType)
        if self.compare(trueNumber) == .orderedSame && objCType == trueObjCType || self.compare(falseNumber) == .orderedSame && objCType == falseObjcType {
            return true
        }else{
            return false
        }
    }
}

public enum Index<T:Any>:Comparable{
    case array(Int)
    case dictionary(DictionaryIndex<String,T>)
    case null
    
    public static func == (lhs: Index<T>, rhs: Index<T>) -> Bool {
        switch (lhs,rhs) {
        case (.array(let left), .array(let right)):
            return left == right
        case (.dictionary(let left), .dictionary(let right)):
            return left == right
        case (.null,.null):
            return true
        default:
            return false
        }
    }

    public static func < (lhs: Index<T>, rhs: Index<T>) -> Bool {
        switch (lhs, rhs) {
        case (.array(let left), .array(let right)):
            return left < right
        case (.dictionary(let left), .dictionary(let right)):
            return left < right
        default:
            return false
        }
    }
}

public typealias JSONIndex = Index<JSON>
public typealias JSONRawIndex = Index<Any>

extension JSON : Swift.Collection{
    public typealias Index = JSONRawIndex
    
    public var startIndex:Index{
        switch type {
        case .array:
            return .array(rawArray.startIndex)
        case .dictionary:
            return .dictionary(rawDictionary.startIndex)
        default:
            return .null
        }
    }
    
    public var endIndex:Index{
        switch type {
        case .array:
            return .array(rawArray.endIndex)
        case .dictionary:
            return .dictionary(rawDictionary.endIndex)
        default:
            return .null
        }
    }
    
    public func index(after i: Index) -> Index {
        switch i {
        case .array(let idx):
            return .array(rawArray.index(after: idx))
        case .dictionary(let idx):
            return .dictionary(rawDictionary.index(after: idx))
        default:
            return .null
        }
    }
    
    public subscript (position:Index) -> (String,JSON){
        switch position{
        case .array(let idx):
            return (String(idx),JSON(self.rawArray[idx]))
        case .dictionary(let idx):
            let (key,value) = self.rawDictionary[idx]
            return (key,JSON(value))
        default:
            return ("", JSON.null)
        }
        
    }
    
}

extension JSON{
    public var array:[JSON]?{
        if self.type == .array {
            return self.rawArray.map{JSON($0)}
        }else{
            return nil
        }
    }
    
    public var arrayValue:[JSON]{
        return self.array ?? []
    }
    
    public var arrayObject:[Any]?{
        get{
            switch self.type {
            case .array:
                return self.rawArray
            default:
                return nil
            }
        }
        set{
            if let array = newValue {
                self.object = array
            } else {
                self.object = NSNull()
            }
        }
        
    }
    
}

extension JSON {
     /// If `type` is `.array`, return json whose object is `array[index]`, otherwise return null json with error.
    fileprivate subscript(index index: Int) -> JSON {
        get {
            if self.type != .array {
                var r = JSON.null
                r.error = self.error ?? SwiftyJSONError.wrongType
                return r
            } else if self.rawArray.indices.contains(index) {
                return JSON(self.rawArray[index])
            } else {
                var r = JSON.null
                r.error = SwiftyJSONError.indexOutOfBounds
                return r
            }
        }
        set {
            if self.type == .array &&
                self.rawArray.indices.contains(index) &&
                newValue.error == nil {
                self.rawArray[index] = newValue.object
            }
        }
    }
    
    /// If `type` is `.dictionary`, return json whose object is `dictionary[key]` , otherwise return null json with error.
    fileprivate subscript(key key: String) -> JSON {
        get {
            var r = JSON.null
            if self.type == .dictionary {
                if let o = self.rawDictionary[key] {
                    r = JSON(o)
                } else {
                    r.error = SwiftyJSONError.notExist
                }
            } else {
                r.error = self.error ?? SwiftyJSONError.wrongType
            }
            return r
        }
        set {
            if self.type == .dictionary && newValue.error == nil {
                self.rawDictionary[key] = newValue.object
            }
        }
    }
    
    /// If `sub` is `Int`, return `subscript(index:)`; If `sub` is `String`,  return `subscript(key:)`.
    fileprivate subscript(sub sub: JSONSubscriptType) -> JSON {
        get {
            switch sub.jsonKey {
            case .index(let index): return self[index: index]
            case .key(let key): return self[key: key]
            }
        }
        set {
            switch sub.jsonKey {
            case .index(let index): self[index: index] = newValue
            case .key(let key): self[key: key] = newValue
            }
        }
    }
    
    /**
     Find a json in the complex data structures by using array of Int and/or String as path.
     
     Example:
     
     ```
     let json = JSON[data]
     let path = [9,"list","person","name"]
     let name = json[path]
     ```
     
     The same as: let name = json[9]["list"]["person"]["name"]
     
     - parameter path: The target json's path.
     
     - returns: Return a json found by the path or a null json with error
     */
    public subscript(path: [JSONSubscriptType]) -> JSON {
        get {
            return path.reduce(self) { $0[sub: $1] }
        }
        set {
            switch path.count {
            case 0:
                return
            case 1:
                self[sub:path[0]].object = newValue.object
            default:
                var aPath = path
                aPath.remove(at: 0)
                var nextJSON = self[sub: path[0]]
                nextJSON[aPath] = newValue
                self[sub: path[0]] = nextJSON
            }
        }
    }

    /**
     Find a json in the complex data structures by using array of Int and/or String as path.
     
     - parameter path: The target json's path. Example:
     
     let name = json[9,"list","person","name"]
     
     The same as: let name = json[9]["list"]["person"]["name"]
     
     - returns: Return a json found by the path or a null json with error
     */
    public subscript(path: JSONSubscriptType...) -> JSON {
        get {
            return self[path]
        }
        set {
            self[path] = newValue
        }
    }
    
}


// MARK: - Subscript

/**
 *  To mark both String and Int can be used in subscript.
 */
public enum JSONKey {
    case index(Int)
    case key(String)
}

public protocol JSONSubscriptType {
    var jsonKey: JSONKey { get }
}

extension Int: JSONSubscriptType {
    public var jsonKey: JSONKey {
        return JSONKey.index(self)
    }
}

extension String: JSONSubscriptType {
    public var jsonKey: JSONKey {
        return JSONKey.key(self)
    }
}
