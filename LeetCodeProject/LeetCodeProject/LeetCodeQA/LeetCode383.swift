//
//  LeetCode383.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/19.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个赎金信 (ransom) 字符串和一个杂志(magazine)字符串，判断第一个字符串ransom能不能由第二个字符串magazines里面的字符构成。如果可以构成，返回 true ；否则返回 false。
 
 (题目说明：为了不暴露赎金信字迹，要从杂志上搜索各个需要的字母，组成单词来表达意思。)
 
 注意：
 你可以假设两个字符串均只含有小写字母。
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 */
class LeetCode383: NSObject {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var path = [Character:Int].init()
        var path1 = [Character:Int].init()
        
        for char in ransomNote {
            if path.keys.contains(char){
                let count = path[char]
                path[char] = count!+1;
            }else{
                path[char] = 1;
            }
        }
        for char in magazine {
            if path1.keys.contains(char){
                let count = path1[char]
                path1[char] = count!+1;
            }else{
                path1[char] = 1;
            }
        }
        
        for key in path1.keys {
            if path.keys.contains(key){
                if path1[key]! >= path[key]!{
                    path.removeValue(forKey: key)
                }
            }
        }
        
        return path.count == 0
    }
}
