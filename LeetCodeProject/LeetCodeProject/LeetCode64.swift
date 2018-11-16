//
//  LeetCode64.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/15.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 
 说明：每次只能向下或者向右移动一步。
 输入:
 [
 [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 输出: 7
 解释: 因为路径 1→3→1→1→1 的总和最小。
 */
class LeetCode64: NSObject {
    class  func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 && grid[0].count > 0 else {
            return 0
        }
        
        let m = grid.count
        let n = grid[0].count
        var dp = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
        
        dp[0][0] = grid[0][0]
        
        for i in 1..<m {
            dp[i][0] = dp[i-1][0] + grid[i][0];
        }
        for j in 1..<n {
            dp[0][j] = dp[0][j-1] + grid[0][j]
        }
        for i in 1..<m{
            for j in 1..<n{
                dp[i][j] = min(dp[i-1][j], dp[i][j-1])+grid[i][j]
            }
        }
        return dp[m-1][n-1]
    }
    
    
}
