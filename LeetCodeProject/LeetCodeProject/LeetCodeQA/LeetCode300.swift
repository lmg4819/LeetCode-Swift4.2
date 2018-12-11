//
//  LeetCode300.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/10.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个无序的整数数组，找到其中最长上升子序列的长度。
 输入: [10,9,2,5,3,7,101,18]
 输出: 4
 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 */
class LeetCode300: NSObject {
  class  func lengthOfLIS(_ nums: [Int]) -> Int {
    var length_global = 0
    var length_current = [Int].init(repeating:1 , count: nums.count)
    
    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] {
                length_current[i] = max(length_current[i], length_current[j] + 1)
            }
        }
        length_global = max(length_global, length_current[i])
    }
    
    return length_global
    }
}
