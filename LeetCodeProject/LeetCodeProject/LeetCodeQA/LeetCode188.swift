//
//  LeetCode188.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/3.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。
 
 设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。
 
 注意: 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 
 输入: [2,4,1], k = 2
 输出: 2
 解释: 在第 1 天 (股票价格 = 2) 的时候买入，在第 2 天 (股票价格 = 4) 的时候卖出，这笔交易所能获得利润 = 4-2 = 2 。
 
 
 输入: [3,2,6,5,0,3], k = 2
 输出: 7
 解释: 在第 2 天 (股票价格 = 2) 的时候买入，在第 3 天 (股票价格 = 6) 的时候卖出, 这笔交易所能获得利润 = 6-2 = 4 。
 随后，在第 5 天 (股票价格 = 0) 的时候买入，在第 6 天 (股票价格 = 3) 的时候卖出, 这笔交易所能获得利润 = 3-0 = 3 。
 
 
 */
class LeetCode188: NSObject {
    class  func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        guard k>0 && n>1 else {
            return 0
        }
        guard k<n else {
            return makeMaxProfit(prices)
        }
        var local = Array(repeating: 0, count: k+1),global = Array(repeating: 0, count: k+1)
        for i in 0..<n-1 {
            let diff = prices[i+1] - prices[i]
            for j in stride(from: k, to: 0, by: -1){
                local[j] = max(global[j-1] + max(diff, 0),local[j]+diff)
                global[j] = max(global[j], local[j])
            }
            
        }
        return global[k]
    }
    
    
    class func makeMaxProfit(_ prices:[Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            let diff = prices[i] - prices[i-1]
            sum += diff > 0 ? diff : 0
        }
        return sum
    }
    
}
