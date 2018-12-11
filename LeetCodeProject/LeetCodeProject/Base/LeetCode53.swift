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
 [-2,1,-3,4,-1,2,1,-5,4]
 1:[[-2]]
 2:[[-2][1]]
 3:[[-2][1][1]]
 4:[[-2][1][1][4]]
 5:[[-2][1][1][4][4]]
 6:[[-2][1][1][4][4][4,-1,2]]
 7:[[-2][1][1][4][4][4,-1,2][4,-1,2,1]]
 8:[[-2][1][1][4][4][4,-1,2][4,-1,2,1]]
 9:[[-2][1][1][4][4][4,-1,2][4,-1,2,1]]
 */
class LeetCode53: NSObject {
    func maxSubArray(_ nums: [Int]) -> Int {
        var numbers = [[Int]].init()
        
        numbers.append([nums[0]])
        for i in 1..<nums.count {
            if nums[i] > 0{
                numbers[i] = [nums[i]]
            }else{
                numbers[i] = numbers[i-1]
            }
        }
        var sum = 0
        
        for i in numbers.last! {
            sum += numbers.last![i]
        }
        return sum
    }
}
