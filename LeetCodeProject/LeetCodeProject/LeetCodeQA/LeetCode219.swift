//
//  LeetCode219.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/6.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的绝对值最大为 k。
 */
class LeetCode219: NSObject {
   class func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {

    guard nums.count > 0 else {
        return false
    }
        
    var dict = [Int: Int]()
    
    for i in 0..<nums.count {
        guard let index = dict[nums[i]], i - index <= k else {
            dict[nums[i]] = i
            continue
        }
        
        return true
    }
    
    return false
    }
}
