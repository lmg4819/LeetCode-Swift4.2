//
//  LeetCode275.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/7.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 这是 H指数 的延伸题目，本题中的 citations 数组是保证有序的。
 你可以优化你的算法到对数时间复杂度吗？

 */
class LeetCode275: NSObject {
    class func hIndex(_ citations: [Int]) -> Int {
        guard citations.count > 0 else {
            return 0
        }
        for (index,value) in citations.enumerated() {
            if value >= (citations.count - index){
                return citations.count - index
            }
        }
        return 0
    }
}
