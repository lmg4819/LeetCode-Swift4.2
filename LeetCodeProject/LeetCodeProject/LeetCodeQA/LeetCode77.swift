//
//  LeetCode77.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/19.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合
 输入: n = 4, k = 2
 输出:
 [
 [1,2]
 [1,3]
 [1,4]
 [2,3]
 [2,4]
 [3,4]
 
 
 ]
 */
class LeetCode77: NSObject {
    
  class  func combine(_ n:Int,_ k:Int) -> [[Int]] {
        var res = [[Int]].init()
        var path = [Int].init()

        return res
    }
    
    class func _dfs(_ res:inout [[Int]],path:inout [Int],start:Int,n:Int,k:Int) {
        if k == 0 {
            res.append(path);
            return
        }
        while start <= n-k+1 {
            
        }
        
    }
    
//    class  func combine(_ n: Int, _ k: Int) -> [[Int]] {
//
//        var res = [[Int]].init()
//        var path = [Int].init()
//        if k == 0 {
//            return res
//        }
//        _dfs(res: &res, path: &path, start: 1, n: n, k: k)
//        return res
//
//    }
//
//
//    class func _dfs(res:inout [[Int]],path:inout [Int],start:Int,n:Int,k:Int) {
//        if k == 0 {
//            res.append(path)
//            return
//        }
//        var start = start
//        while start <= n-k+1{
//            path.append(start)
//            start += 1
//            _dfs(res: &res, path: &path, start: start, n: n, k: k-1)
//            path.removeLast()
//        }
//    }
}
