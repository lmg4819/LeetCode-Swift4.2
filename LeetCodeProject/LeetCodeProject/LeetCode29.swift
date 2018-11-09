//
//  LeetCode29.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/8.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
 
 返回被除数 dividend 除以除数 divisor 得到的商。
 
 示例 1:
 
 输入: dividend = 10, divisor = 3
 输出: 3
 示例 2:
 
 输入: dividend = 7, divisor = -3
 输出: -2
 
 被除数和除数均为 32 位有符号整数。
 除数不为 0。
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。本题中，如果除法结果溢出，则返回 231 − 1。
 */
class LeetCode29: NSObject {
    
    class func divide(_ dividend:Int, _ divisor:Int) ->Int  {
    
        
        let isNegative = (dividend < 0) != (divisor < 0)
        var dividend = abs(dividend)
        var divisor = abs(divisor)
        var count = 0
        
        while dividend >= divisor {
            var shift = 0
            while dividend >= (divisor << shift){
                shift += 1
            }
            dividend -= divisor << (shift - 1)
            count += 1 << (shift - 1)
        }
        
       let res = isNegative ? -count : count
        
        if res > INT32_MAX || res < -INT32_MAX-1 {
            return Int(INT32_MAX)
            
        }
        return res
    }
}
