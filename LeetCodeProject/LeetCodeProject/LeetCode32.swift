//
//  LeetCode32.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/8.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。
 
 */
/*
 
 )()()())
 0
 6
 0
 4
 0
 2
 0
 0
 
 left  ：( 的个数
 right ：）的个数
 */
class LeetCode32: NSObject {
    
    class func longestValidParentheses(_ s: String) -> Int {
        let sChars = [Character](s.characters)

        var stack = [Int].init()
        var longest = 0
        for (i,char) in sChars.enumerated() {
            if char == "(" || stack.isEmpty || sChars[stack.last!] == ")" {
                stack.append(i)
            }else {
                stack.removeLast()
                if stack.isEmpty {
                    longest = max(longest, i+1)
                }else{
                    longest = max(longest, i-stack.last!)
                }
            }
        }
        return longest
    }
    
//       class func longestValidParentheses(_ s: String) -> Int {
//        var left = 0,right = 0
//        var maxCount = 0
//        var currentCount = 0
//        for index in 0..<s.characters.count {
//            right = 0
//            left = 0
//            currentCount = 0
//            if maxCount >= (s.characters.count-index){
//                return maxCount
//            }
//            for j in index..<s.characters.count {
//                if s[s.index(s.startIndex, offsetBy: j)] == "(" {
//                    left += 1
//                }else{
//                    right += 1
//                }
//                if left < right {
//                    maxCount = maxCount < currentCount ? currentCount : maxCount
//                    break
//                }else if left == right {
//                    currentCount = left*2
//
//                }
//                if j == s.characters.count-1 {
//                    maxCount = maxCount < currentCount ? currentCount : maxCount
//                }
//            }
//        }
//        return maxCount
//    }
    
    
    
}
