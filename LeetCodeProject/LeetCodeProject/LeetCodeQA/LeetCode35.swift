//
//  LeetCode35.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/9.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 
 你可以假设数组中无重复元素。
 示例 1:
 
 输入: [1,3,5,6], 5
 输出: 2
 示例 2:
 
 输入: [1,3,5,6], 2
 输出: 1
 
 
 */
class LeetCode35: NSObject {

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard target <= nums.last! else {
            return nums.count
        }
        for index in 0..<nums.count {
            if nums[index] == target {
                return index
            }else if nums[index] > target {
                return index
            }
        }
        fatalError()
    }
}
