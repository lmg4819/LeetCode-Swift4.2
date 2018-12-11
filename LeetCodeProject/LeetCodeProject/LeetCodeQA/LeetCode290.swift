//
//  LeetCode290.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/10.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一种 pattern(模式) 和一个字符串 str ，判断 str 是否遵循相同的模式。
 
 这里的遵循指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应模式。
 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true

 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母。
 */
class LeetCode290: NSObject {
  class  func wordPattern(_ pattern: String, _ str: String) -> Bool {
       
        let strs = str.components(separatedBy: " ")
        if pattern.count != strs.count {
            return false
        }
        var path1 = [String:Int].init()
        var pathArray1 = [Int].init()
        
        
        var path2 = [Character:Int].init()
        var pathArray2 = [Int].init()
        
    
        for (index,value) in strs.enumerated() {
            if !path1.keys.contains(value){
                path1[value] = index
                pathArray1.append(index)
            }else{
                let preIndex = path1[value]!
                pathArray1.append(preIndex)
            }
            let strIndex = pattern.index(pattern.startIndex, offsetBy: index)
            let character:Character = pattern[strIndex]
            
            if !path2.keys.contains(character){
                path2[character] = index
                pathArray2.append(index)
            }else{
                let preIndex = path2[character]!
                pathArray2.append(preIndex)
            }
        }
        return pathArray1 == pathArray2
        
    }
}
