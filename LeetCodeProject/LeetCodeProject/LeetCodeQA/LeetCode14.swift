//
//  LeetCode14.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/9.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
 */
class LeetCode14: NSObject {
    func longestCommonPrefix(_ strs: [String]) -> String {

        guard strs.count != 0 else {
            return ""
        }
        
        var res = ""
        let firstChar = strs.first

        for i in firstChar! {
            res.append(i)
            for string in strs {
                if !string.hasPrefix(res)
                {
                    res.removeLast(1)
                    return res
                }
            }
        }
        return res
    }
    
//    func longestCommonPrefix(_ strs: [String]) -> String {
//        var longestPrefix = [Character](), index = 0
//
//        guard let firstStr = strs.first else {
//            return String(longestPrefix)
//        }
//
//        let firstStrChars = Array(firstStr)
//        let strsChars = strs.map { Array($0) }
//
//        while index < firstStr.count {
//
//            longestPrefix.append(firstStrChars[index])
//
//            for str in strsChars {
//                if index >= str.count {
//                    return String(longestPrefix.dropLast())
//                }
//
//                if str[index] != longestPrefix[index] {
//                    return String(longestPrefix.dropLast())
//                }
//            }
//
//            index += 1
//        }
//
//        return String(longestPrefix)
//    }
}
