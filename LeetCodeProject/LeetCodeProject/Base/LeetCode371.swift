//
//  LeetCode371.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/18.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 不使用运算符 + 和 - ​​​​​​​，计算两整数 ​​​​​​​a 、b ​​​​​​​之和。
 
 示例 1:
 
 输入: a = 1, b = 2
 输出: 3
 示例 2:
 
 输入: a = -2, b = 3
 输出: 1
 
 */
class LeetCode371: NSObject {
    func getSum(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : getSum(a^b,(a&b)<<1);
    }
}
