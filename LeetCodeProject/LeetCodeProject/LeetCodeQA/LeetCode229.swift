//
//  LeetCode229.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/7.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个大小为 n 的数组，找出其中所有出现超过 ⌊ n/3 ⌋ 次的元素。
 
 说明: 要求算法的时间复杂度为 O(n)，空间复杂度为 O(1)。
 
 输入: [3,2,3]
 输出: [3]
 
 输入: [1,1,1,3,3,2,2,2]
 输出: [1,2]
 */
class LeetCode229: NSObject {
    class  func majorityElement(_ nums: [Int]) -> [Int] {
        var res = [Int:Int].init()
        
        for i in 0..<nums.count {
            if res.keys.contains(nums[i]){
                let value = res[nums[i]]!+1
                res[nums[i]] = value
            }else{
                res[nums[i]] = 1
            }
        }
        
        let dict = res.filter { (arg) -> Bool in
            
            let (_, value) = arg
            return value > nums.count/3
        }
        return Array(dict.keys)
    }
}
