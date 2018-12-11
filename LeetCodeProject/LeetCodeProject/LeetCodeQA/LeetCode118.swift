//
//  LeetCode118.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/27.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
 输入: 5
 输出:
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
 ]
 */
class LeetCode118: NSObject {
  class  func generate(_ numRows: Int) -> [[Int]] {
        var res:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: numRows), count: numRows)
        guard numRows > 0 else {
            return res
        }
        for i in 0..<numRows {
            
            for j in 0...i{
                if j == 0 || j == i{
                    res[i][j] = 1
                }else {
                    res[i][j] = res[i-1][j] + res[i-1][j-1]
                }
            }
        }
    for i in 0..<numRows {
        res[i].removeLast(numRows-i-1)
    }
    
    
        return res
    }
}
