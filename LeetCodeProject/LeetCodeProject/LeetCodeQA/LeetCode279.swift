//
//  LeetCode278.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/7.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
 输入: n = 12
 输出: 3
 解释: 12 = 4 + 4 + 4.
 输入: n = 13
 输出: 2
 解释: 13 = 4 + 9.
 
 1
 4
 9
 16
 25
 36
 
 Dybamic Programming
 
 */
class LeetCode279: NSObject {
  class  func numSquares(_ n: Int) -> Int {
        var n = n
        while n%4 == 0 {
            n = n/4
        }
        if n%8 == 7 {
            return 4
        }
        var a = 0
        while a * a <= n {
            let b:Int = Int(sqrt(Double(n - a * a)))
            if a * a + b * b == n {
                return (a>0 ? 1 : 0) + (b>0 ? 1 : 0)
            }
            a += 1
        }

        return 3
    }
    
   class func num1Squares(_ n:Int) -> Int{
        var path:[Int] = [Int].init(repeating: NSIntegerMax, count: n+1)
        path[0] = 0
        for i in 0...n {
            var j = 1
            while i + j * j <= n {
                path[i + j * j] = min(path[i + j * j], path[i] + 1)
                j += 1
            }
        }
        return path.last!
    }
    
    
}
