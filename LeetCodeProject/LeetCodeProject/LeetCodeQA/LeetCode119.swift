//
//  LeetCode119.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/28.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 
 
 输入: 3
 输出: [1,3,3,1]
 */
class LeetCode119: NSObject {
    class func getRow(_ rowIndex: Int) -> [Int] {
        var res:[[Int]] = Array.init(repeating: Array.init(repeating: 1, count: rowIndex+1), count: rowIndex+1)
        guard rowIndex > 0 else {
            return [1]
        }
        for i in 0...rowIndex {
            
            for j in 0...i{
                if j == 0 || j == i{
                    res[i][j] = 1
                }else {
                    res[i][j] = res[i-1][j] + res[i-1][j-1]
                }
            }
        }
        for i in 0...rowIndex {
            res[i].removeLast(rowIndex-i)
        }
        return res.last!
    }
}
