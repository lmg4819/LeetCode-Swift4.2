//
//  LeetCode13.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/8.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。
 
 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 */
class LeetCode13: NSObject {
  class  func romanToInt(_ s: String) -> Int {
        let dict = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
        var number:Int = 0
        
        for (index,character) in s.enumerated() {
            if dict.keys.contains("\(character)"){
                if index < s.count-1{
                    let nextIndex = s.index(s.startIndex, offsetBy: index+1)
                    if character == "I" && (s[nextIndex] == "V" || s[nextIndex] == "X") {
                        number -= dict["\(character)"]!
                    }else if character == "X" && (s[nextIndex] == "L" || s[nextIndex] == "C") {
                        number -= dict["\(character)"]!
                    }else if character == "C" && (s[nextIndex] == "D" || s[nextIndex] == "M") {
                        number -= dict["\(character)"]!
                    }else {
                        number += dict["\(character)"]!
                    }
                }else{
                    number += dict["\(character)"]!
                }
                
            }
        }
        return number
    }
}
