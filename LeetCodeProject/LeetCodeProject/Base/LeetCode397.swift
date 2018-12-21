//
//  LeetCode397.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/20.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个正整数 n，你可以做如下操作：
 
 1. 如果 n 是偶数，则用 n / 2替换 n。
 2. 如果 n 是奇数，则可以用 n + 1或n - 1替换 n。
 n 变为 1 所需的最小替换次数是多少？
 
 示例 1:
 
 输入:
 8
 
 输出:
 3
 
 解释:
 8 -> 4 -> 2 -> 1
 示例 2:
 
 输入:
 7
 
 输出:
 4
 
 解释:
 7 -> 8 -> 4 -> 2 -> 1
 或
 7 -> 6 -> 3 -> 2 -> 1
 */
class LeetCode397: NSObject {
    
    class  func integerReplacement(_ n:Int) -> Int {
        if n == 1 {
            return 0
        }
        if  n%2 == 0 {
            return integerReplacement(n/2)+1
        }else{
            return min(integerReplacement(n+1)+1, integerReplacement(n-1)+1)
        }
    }
}
