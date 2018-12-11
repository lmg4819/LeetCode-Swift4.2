//
//  LeetCode17.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/9.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
 1
 2 abc
 3 def
 4 ghi
 5 jkl
 6 mno
 7 pqrs
 8 tuv
 9 wxyz
 "23"
 ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
 
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 */
class LeetCode17: NSObject {
    class  func letterCombinations(_ digits: String) -> [String] {
        
        guard digits.characters.count > 0 else {
            return []
        }
        
        let dict:[String:[String]] = ["2":["a","b","c"],
                                      "3":["d","e","f"],
                                      "4":["g","h","i"],
                                      "5":["j","k","l"],
                                      "6":["m","n","o"],
                                      "7":["p","q","r","s"],
                                      "8":["t","u","v"],
                                      "9":["w","x","y","z"]];
        var path:[[String]] = [[String]].init()
        for character in digits {
            let tempArray:[String] = dict["\(character)"]!
            path.append(tempArray)
        }
        var res:[String] = path.first!
        path.removeFirst(1)
        backTrace(&path, &res)
        return res
    }
    
    class   func backTrace(_ path:inout [[String]],_ resultArray:inout [String] ) {
        if path.count == 0 {
            return
        }
        let firstArray = path.first!
        path.removeFirst(1)
    
        var array:[String] = [String].init()
        for value in resultArray {
            for value1 in firstArray {
                array.append(value + value1)
            }
        }
        resultArray = array
        backTrace(&path, &resultArray)
        
    }
}
