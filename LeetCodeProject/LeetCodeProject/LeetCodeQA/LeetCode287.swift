//
//  LeetCode287.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/10.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个包含 n + 1 个整数的数组 nums，其数字都在 1 到 n 之间（包括 1 和 n），可知至少存在一个重复的整数。假设只有一个重复的整数，找出这个重复的数。
 输入: [1,3,4,2,2]
 输出: 2
 */
class LeetCode287: NSObject {
  class  func findDuplicate(_ nums: [Int]) -> Int {
        var res = [Int:Int].init()
        
        for i in 0..<nums.count {
            if res.keys.contains(nums[i]) {
                return nums[i]
            }else{
                res[nums[i]] = i
            }
        }
        return 0
    }
}
