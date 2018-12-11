//
//  LeetCode1.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/9.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 
 你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
class LeetCode1: NSObject {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int].init()
        for (index,num) in nums.enumerated(){
            if let lastIndex = dict[target-num]{
                return [lastIndex,index]
            }
            dict[num] = index
        }
        fatalError("No valid outputs")
    }
}
