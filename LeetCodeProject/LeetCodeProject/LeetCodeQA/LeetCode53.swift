//
//  LeetCode53.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/11.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

 
 */
class LeetCode53: NSObject {
  class  func maxSubArray(_ nums: [Int]) -> Int {
        var maxprocess = nums[0]
        var sum = nums[0]
        for i in 1..<nums.count {
            maxprocess = max(nums[i], nums[i]+maxprocess)
            sum = max(sum, maxprocess)
        }
        return sum
        
    }
}
