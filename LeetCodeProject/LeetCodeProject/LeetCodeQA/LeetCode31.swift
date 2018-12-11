//
//  LeetCode31.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/8.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
 
 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
 
 必须原地修改，只允许使用额外常数空间。
 
 以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
 1,2,3,3,4,5,1,1 → 1,2,3,3,4,1,1,5
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 
 1,1,2,3 -> 1,1,3,2

 
 */
class LeetCode31: NSObject {
    
    func nextPermutation(_ nums:inout [Int]) {
        var shouldBreak = false
        var shouldReturn = false
        
        for i in (1..<nums.count).reversed() {
            if nums[i] > nums[i-1]{
                shouldReturn = true
                for j in (i..<nums.count).reversed(){
                    if nums[j] > nums[i-1]{
                        (nums[i-1],nums[j]) = (nums[j],nums[i-1])
                        nums = nums[0...i-1] + nums[i...].reversed()
                        shouldBreak = true
                        break
                    }
                }
                if shouldBreak {
                    break
                }
            }
        }
        if !shouldReturn {
            nums.reverse()
        }
    }
}
