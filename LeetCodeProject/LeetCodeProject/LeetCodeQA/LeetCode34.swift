//
//  LeetCode34.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/12.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
 
 你的算法时间复杂度必须是 O(log n) 级别。
 如果数组中不存在目标值，返回 [-1, -1]。
 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 
 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]
 */
class LeetCode34: NSObject {
  class  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res:[Int] = [Int].init(repeating: -1, count: 2)
        
        var left = 0,right = nums.count-1
        while left <= right{
            if res.first == -1 {
                if nums[left] == target {
                    res.remove(at: 0)
                    res.insert(left, at: 0)
                    if res.last != -1 && res.first != -1 {
                        return res
                    }
                }else{
                    left += 1
                }
            }
            
            if res.last == -1 {
                if nums[right] == target {
                    res.remove(at: 1)
                    res.append(right)
                    if res.last != -1 && res.first != -1 {
                        return res
                    }
                }else{
                    right -= 1
                }
            }
            
            
        }
        return res
    }
}
