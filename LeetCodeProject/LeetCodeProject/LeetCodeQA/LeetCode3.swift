//
//  LeetCode3.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/12.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个字符串，找出不含有重复字符的最长子串的长度。
 0 0
 
 
 输入: "abcabcbb"
 
 
 输出: 3
 解释: 无重复字符的最长子串是 "abc"，其长度为 3。
 */
class LeetCode3: NSObject {
    class  func lengthOfLongestSubstring(_ s: String) -> Int {
        var longest = 0,left = 0,set = Set<Character>()
        var sChars = Array(s)
        for (i,character) in sChars.enumerated() {
            if set.contains(character){
                longest = max(longest, i-left)
                
                while sChars[left] != character {
                    set.remove(sChars[left])
                    left += 1
                }
                left += 1
            }else
            {
                set.insert(character)
            }
        }
        return max(longest, sChars.count-left)
        
    }
    
   
}
