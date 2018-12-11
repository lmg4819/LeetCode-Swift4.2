//
//  LeetCode181.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/6.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 比较两个版本号 version1 和 version2。
 如果 version1 > version2 返回 1，如果 version1 < version2 返回 -1， 除此之外返回 0。
 
 你可以假设版本字符串非空，并且只包含数字和 . 字符。
 
 . 字符不代表小数点，而是用于分隔数字序列。
 
 例如，2.5 不是“两个半”，也不是“差一半到三”，而是第二版中的第五个小版本。
 
 输入: version1 = "0.1", version2 = "1.1"
 输出: -1
 
 输入: version1 = "1.0.1", version2 = "1"
 输出: 1
 
 输入: version1 = "7.5.2.4", version2 = "7.5.3"
 输出: -1
 */
class LeetCode181: NSObject {
    class func compareVersion(_ version1: String, _ version2: String) -> Int {
        var path1 = version1.components(separatedBy: ".")
        var path2 = version2.components(separatedBy: ".")
        let maxCount = path1.count > path2.count ? path1.count : path2.count
        if path1.count != maxCount {
            for _ in 0..<(maxCount-path1.count){
                path1.append("0")
            }
           
        }
        if path2.count != maxCount {
            for _ in 0..<(maxCount-path2.count){
                path2.append("0")
            }
        }
        for i in 0..<maxCount {
            let number1:Int! = Int(path1[i])
            let number2:Int! = Int(path2[i])
            if number1 > number2{
                return 1
            }else if (number1 < number2){
                return -1
            }else{
                if i == path1.count - 1 && i == path2.count-1{
                    return 0
                }
            }
        }
        return 0
    }
}
