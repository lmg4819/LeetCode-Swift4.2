//
//  LeetCode47.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/11.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个可包含重复数字的序列，返回所有不重复的全排列。
 输入: [1,1,2,1]
 输出:
 [
 [1,1,2],
 [1,2,1],
 [2,1,1]
 ]
 1:[[1]]
 11:[[11][11]]
 112:[[211][121][112]]
 1121:[[1211][2111] [1121]]
 */
class LeetCode47: NSObject {
    class  func permuteUnique(_ nums:[Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return [[]]
        }
        var path = [[Int]].init()
        path.append([nums[0]])
        
        dfs(nums, &path, index: 1)
        return path
    }
    
    class func dfs(_ nums:[Int],_ path:inout [[Int]],index:Int){
        if index == nums.count {
            return
        }
        var res = [[Int]].init()
        let value = nums[index]
        
        for i in 0..<path.count {
            let array = path[i]
            for j in 0...array.count{
                var temp = array
                temp.insert(value, at: j)
                if !res.contains(temp){
                    res.append(temp)
                }
            }
        }
        path = res
        dfs(nums, &path, index: index+1)
    }
}
