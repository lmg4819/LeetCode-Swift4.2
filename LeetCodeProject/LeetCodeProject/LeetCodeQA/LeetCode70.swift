//
//  LeetCode70.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/15.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 注意：给定 n 是一个正整数。
 
 示例 1：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 
 */
class LeetCode70: NSObject {
    class  func climbStairs(_ n: Int) -> Int {
        
        if n == 1 || n == 0 {
            return 1
        }else if n == 2 {
            return 2
        }else {
            var k = 3
            var res = 0
            var i = 1 , j = 2
            while k <= n{
                res = i + j
                i = j
                j = res
                k += 1
            }
            return res
            
        }
    }
}
