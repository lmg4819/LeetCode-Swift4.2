//
//  LeetCode45.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/9.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个非负整数数组，你最初位于数组的第一个位置。
 
 数组中的每个元素代表你在该位置可以跳跃的最大长度。
 
 你的目标是使用最少的跳跃次数到达数组的最后一个位置。
 
 输入: [2,3,1,1,4]
 输出: 2
 0   2
 1   2
 3   1
 
 解释: 跳到最后一个位置的最小跳跃数是 2。
 从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。
 假设你总是可以到达数组的最后一个位置。
 */
class LeetCode45: NSObject {
    
    class  func jump(_ nums:[Int]) -> Int {
        var res = 0,cur = 0
        while  cur < nums.count - 1 {
            res += 1
            let pre = cur
            for i in 0...pre {
                cur = max(cur, i+nums[i])
            }
        }
        return res
        
    }
    
   
}
