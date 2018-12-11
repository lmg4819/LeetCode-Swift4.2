//
//  LeetCode8.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/9.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 实现 atoi，将字符串转为整数。
 
 该函数首先根据需要丢弃任意多的空格字符，直到找到第一个非空格字符为止。如果第一个非空字符是正号或负号，选取该符号，并将其与后面尽可能多的连续的数字组合起来，这部分字符即为整数的值。如果第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。
 
 字符串可以在形成整数的字符后面包括多余的字符，这些字符可以被忽略，它们对于函数没有影响。
 
 当字符串中的第一个非空字符序列不是个有效的整数；或字符串为空；或字符串仅包含空白字符时，则不进行转换。
 
 */
class LeetCode8: NSObject {
    
  class  func myAtoi(str: String) -> Int {
        var res = 0
        var flag = 1
        var index = 0
    
    let int_min:Int = Int(-INT32_MAX-1)
        
        // trim
        let content = [Character](str.characters)
        while index < content.count {
            guard content[index] == " " else {
                break
            }
            index += 1
        }
        guard index < content.count else {
            return res
        }
        
        // handle flag
        if content[index] == "-" {
            flag = -1
            index += 1
        } else if content[index] == "+" {
            index += 1
        }
        
        while index < content.count {
            guard _isDigit(char: content[index]) else {
                break
            }
            
            res = res * 10 + Int(String(content[index]))!
            
            if res >= INT32_MAX {
                if flag == 1 {
                    return Int(INT32_MAX)
                } else if res > INT32_MAX && flag == -1 {
                    return int_min
                }
            }
            
            index += 1
        }
        
        return flag * res
    }
    
 class  private func _isDigit(char: Character) -> Bool {
        return char >= "0" && char <= "9"
    }
}
