//
//  LeetCode209.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/6.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。
 输入: s = 7, nums = [2,3,1,2,4,3]
 输出: 2
 解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
 */
class LeetCode209: NSObject {
    
  class  func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var miniSize = Int.max, start = 0, currentSum = 0

        for (i, num) in nums.enumerated() {
            currentSum += num

            while currentSum >= s && start <= i {
                miniSize = min(miniSize, i - start + 1)

                currentSum -= nums[start]
                start += 1
            }
        }

        return miniSize == Int.max ? 0 : miniSize
    }
}
