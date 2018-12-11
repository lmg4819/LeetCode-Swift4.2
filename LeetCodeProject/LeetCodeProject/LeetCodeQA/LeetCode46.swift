//
//  LeetCode46.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/11.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 2*3*4*5
 输入: [1,2,3,4]
 输出:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 1:[[1]]
 1 2:[[1,2],[2,1]]
 1 2 3:[[3,1,2],[1,3,2],[1,2,3],[3,2,1],[2,3,1],[2,1,3]]
 
 
 
 
 
 */
class LeetCode46: NSObject {
    class  func permute(_ nums:[Int]) -> [[Int]] {
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
                res.append(temp)
            }
        }
        path = res
        dfs(nums, &path, index: index+1)
    }
}
