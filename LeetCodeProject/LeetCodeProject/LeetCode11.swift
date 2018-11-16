//
//  LeetCode11.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/12.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 
 说明：你不能倾斜容器，且 n 的值至少为 2。
 输入: [1,8,6,2,5,4,8,3,7]
 输出: 49
 
 */
class LeetCode11: NSObject {
    class func maxArea(_ height: [Int]) -> Int {
        
        
        guard height.count > 1 else {
            return 0
        }
        var currentMax = 0
        var left = 0
        var right = height.count - 1
        
        
        
        while left < right {
            let minHeight = min(height[left], height[right])
            currentMax = max(currentMax, (right-left)*minHeight)
            if minHeight == height[left] {
                left += 1
            }else{
                right -= 1
            }
            
        }
        return currentMax
    }
}
