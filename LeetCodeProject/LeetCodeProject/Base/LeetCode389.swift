//
//  LeetCode389.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/21.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定两个字符串 s 和 t，它们只包含小写字母。
 
 字符串 t 由字符串 s 随机重排，然后在随机位置添加一个字母。
 
 请找出在 t 中被添加的字母。
 输入：
 s = "abcd"
 t = "abcde"
 
 输出：
 e
 
 解释：
 'e' 是那个被添加的字母。
 */
class LeetCode389: NSObject {
  class  func findTheDifference(_ s: String, _ t: String) -> Character {
        let res1 = Array(s).sorted()
        let res2 = Array(t).sorted()
        for (index,char) in res1.enumerated() {
            if char != res2[index] {
               return res2[index]
            }
        }
        return res2.last!
    }
}
