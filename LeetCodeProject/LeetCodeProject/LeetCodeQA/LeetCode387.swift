//
//  LeetCode387.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/20.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
 
 案例:
 
 s = "leetcode"
 返回 0.
 [l][e]
 [l][e][t][c][o][d]
 
 
 [1][3][1][1][1][1]
 [0][1][2]
 
 
 s = "loveleetcode",
 返回 2.
 {l,0}
 {}
 []
 0 1 2 3
 */
class LeetCode387: NSObject {
    class  func firstUniqChar(_ s: String) -> Int {
        var path = [Character:Int].init()
        var res = -1
        
        for char in s {
            if path.keys.contains(char){
                let value = path[char]
                path[char] = value! + 1
            }else{
                path[char] = 1;
            }
        }
        for (index,char) in s.enumerated() {
            if path[char] == 1 {
                res = index
                break
            }
        }
        
        return res
        
    }
}
