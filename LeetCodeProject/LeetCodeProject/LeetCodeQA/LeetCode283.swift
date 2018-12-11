//
//  LeetCode283.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/10.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
  //必须在原数组上操作，不能拷贝额外的数组。
 */
class LeetCode283: NSObject {
    class  func moveZeroes(_ nums: inout [Int]) {
    
        let count = nums.count
        for i in stride(from: count-1, to: -1, by: -1){
            if nums[i] == 0{
                nums.remove(at: i)
                nums.append(0)
            }
        }
        
        print(nums)
    }
    
}
