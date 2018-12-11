//
//  Result.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/26.
//  Copyright © 2018 lmg. All rights reserved.
//

import Foundation

public enum Result<Value>{
    case success(Value)
    case failure(Error)
    
    public var isSuccess:Bool{
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    public var isFailure:Bool{
        return !isSuccess
    }
    
    public var value:Value?{
        switch self {
        case let .success(value):
            return value
        case .failure(_):
            return nil
        }
    }
    
    public var error:Error?{
        switch self {
        case .success(_):
            return nil
        case .failure(let error):
            return error
        }
    }
}


extension Result : CustomStringConvertible{
    public var description: String {
        switch self {
            
        case .success(_):
            return "SUCCESS"
        case .failure(_):
            return "FAILURE"
        }
    }
}

extension Result : CustomDebugStringConvertible{
    public var debugDescription: String {
        switch self {
        case .success(let value):
            return "SUCCESS \(value)"
        case .failure(let error):
            return "FAILURE \(error)"
        }
    }
}

extension Result{
    
    public init(value:() throws ->Value) {
        do {
            self = try .success(value())
        } catch  {
            self = .failure(error)
        }
    }
    
    
    
    
}
