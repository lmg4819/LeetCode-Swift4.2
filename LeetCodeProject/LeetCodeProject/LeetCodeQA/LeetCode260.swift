//
//  LeetCode260.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/7.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个整数数组 nums，其中恰好有两个元素只出现一次，其余所有元素均出现两次。 找出只出现一次的那两个元素。
 输入: [1,2,1,3,2,5]
 输出: [3,5]
 */
class LeetCode260: NSObject {
 class   func singleNumber(_ nums: [Int]) -> [Int] {
        var res = [Int:Int].init()
        for i in 0..<nums.count {
            if !res.keys.contains(nums[i]){
                res[nums[i]] = i
            }else{
                res.removeValue(forKey: nums[i])
            }
        }
    return Array(res.keys)
    }
}
