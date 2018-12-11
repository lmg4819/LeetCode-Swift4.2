//
//  LeetCode43.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/8.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 示例 1:
 
 输入: num1 = "2", num2 = "3"
 输出: "6"
 
 示例 2:
 
 输入: num1 = "123", num2 = "456"
 输出: "56088"
 
 
 
 num1 和 num2 的长度小于110。
 num1 和 num2 只包含数字 0-9。
 num1 和 num2 均不以零开头，除非是数字 0 本身。
 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
 
 */
class LeetCode43: NSObject {
    
    
   class func multiply(_ num1: String, _ num2: String) -> String {
        
        guard num1 != "0" && num2 != "0" else {
            return "0"
        }
        
        let num1Chars = num1.reversed()
        let num2Chars = num2.reversed()
        var res = [Int].init(repeating: 0, count: num1Chars.count + num2Chars.count)
        var finalChars = [String].init(),carry = 0,sum = 0
        
        for (i,char1) in num1Chars.enumerated() {
            let n1 = Int(String(char1))
            for (j,char2) in num2Chars.enumerated() {
                res[i+j] += n1! * Int(String(char2))!
            }
        }
        
        for num in res {
            sum = (carry + num)%10
            carry = (carry + num)/10
            finalChars.insert(String(sum), at: 0)
        }
        
        while !finalChars.isEmpty && finalChars.first == "0" {
            finalChars.removeFirst()
        }
    
        return finalChars.reduce(""){$0 + $1}
        
    }
}
