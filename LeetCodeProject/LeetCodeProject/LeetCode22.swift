//
//  LeetCode22.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/7.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
 例如，给出 n = 3，生成结果为：
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 
 (
 ((
 ()
 
 
 */
class LeetCode22: NSObject {
    func generateParenthesis(_ n: Int) -> [String] {
        var res:[String] = [String].init()
        var path:String = String.init()
        backTrace(n, &res, &path, 0)
        return res
    }
    
    func backTrace(_ n:Int,_ res: inout [String], _ path:inout String, _ index:Int){
        
        
        for i in 0..<n {
            if i == 0{
                path.append("(")
            }
            
            if i == n-1 {
                path.append(")")
            }
            
            for j in 0..<2{
                if j == 0 {
                    path.append("(")
                }else{
                    path.append(")")
                }
            }
        }

    }
}
/*
 
 
 */
