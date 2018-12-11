//
//  LeetCode58.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/15.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。
 
 如果不存在最后一个单词，请返回 0 。
 
 说明：一个单词是指由字母组成，但不包含任何空格的字符串。
 
 示例:
 
 输入: "Hello World"
 输出: 5
 */
class LeetCode58: NSObject {
    class func lengthOfLastWord(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        let res = s.split(separator: " ")
        let resultValue = res.count>0 ? (res.last?.count)! : 0
        
        return resultValue
    }
}
