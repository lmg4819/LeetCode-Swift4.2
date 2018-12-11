//
//  LeetCode322.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/11.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。
 输入: coins = [1, 2, 5], amount = 11
 输出: 3
 解释: 11 = 5 + 5 + 1
 
 输入: coins = [2], amount = 3
 输出: -1
 [1,2,5]
 0 1 2 3 4 5 6 7 8 9 10 11
 [0 0 0 0 0 0 0 0 0 0 0 0]
 [0 1 1 0 0 1 0 0 0 0 0 0]
 [0 1 1 2 0 1 2 0 0 0 0 0] i =
 [0 1 1 2 2 1 2 2 0 0 2 0]
 [0 1 1 2 2 1 2 2 3 3 2 3]
 */
class LeetCode322: NSObject {
    class func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        if amount < 0 {
            return -1
        }
        var nums = [Int].init(repeating: -1, count: amount+1)
        nums[0] = 0
        
        for i in 0..<amount {
            if nums[i] == -1 {
                continue
            }
            for j in 0..<coins.count{
                let k = i + coins[j]
                if k <= amount && (nums[k] == -1 || nums[k] > nums[i] + 1) {
                    nums[k] = nums[i] + 1
                }
            }
            
        }
        return nums[amount]
    }
}
