//
//  ViewController.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/7/25.
//  Copyright © 2018年 lmg. All rights reserved.
//

import UIKit

public class ListNode{
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
/*
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 
 candidates 中的数字可以无限制重复被选取。
 
 说明：
 
 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 
 输入: candidates = [2,3,6,7], target = 7,
 所求解集为:
 [
 [7],
 [2,2,3]
 ]
 
 输入: candidates = [2,3,5], target = 8,
 所求解集为:
 [
 [2,2,2,2],
 [2,3,3],
 [3,5]
 ]
 */

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        countAndSay(9)
        //        strStr("a", "a")
        //        reverse(-123)
        //    var result = isPalindrome(10)
        //    let resultArray = fourSum([-5, 5, 4, -3, 0, 0, 4,-2], 4)
        //        print(resultArray)
//        threeSumClosest([-3,-2,-5,3,-4], -1)
    trap([0,1,0,2,1,0,1,3,2,1,2,1])
        combinationSum([2,3,5], 8)
    }

    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]].init()
        var path = [Int].init()
        backTracing(candidates.sorted(), target: target, res: &res, path: &path, index: 0)
        return res
    }
    
    func backTracing(_ candidates:[Int],target:Int,res:inout [[Int]], path:inout [Int],index:Int) {
        if target < 0 {
            return
        }else if target == 0 {
            res.append(path)
            return
        }else {
            for i in index..<candidates.count{
                if i != index && candidates[i] == candidates[i-1] {
                    continue
                }
                path.append(candidates[i])
                backTracing(candidates, target: target-candidates[i], res: &res, path: &path, index: i+1)
                path.removeLast()
                
            }
        }
        
    }
    
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {

        var res = [[Int]]()
        var path = [Int]()
        
        _dfs(candidates: candidates, target, res: &res, &path, 0)
        return res
    }
  
    private func _dfs(candidates: [Int], _ target: Int,  res: inout [[Int]], _ path: inout [Int], _ index: Int) {
        if target < 0 {
            return
        }
        
        if target == 0 {
            res.append(Array(path))
            return
        }else{
            
            for i in index..<candidates.count{
                path.append(candidates[i])
                _dfs(candidates: candidates, target-candidates[i], res: &res, &path, i)
                path.removeLast()
            }
        }
    }
    
    
    
    
    
   // [0,1,0,2,1,0,1,3,2,1,2,1]
   // 6
    func trap(_ height: [Int]) -> Int {

        if height.count < 2 {
            return 0
        }
        var max = -1,maxIndex = 0
        for i in 0..<height.count {
            if height[i] > max {
                max = height[i]
                maxIndex = i
            }
        }
        var area = 0,root = height[0]

        for i in 0..<maxIndex {
            if root < height[i]{
                root = height[i]
            }else{
                area += (root - height[i])
            }
        }
        root = height.last!
        for i in (maxIndex..<height.count).reversed(){
            if root < height[i]{
                root = height[i]
            }else{
                area += (root - height[i])
            }
        }
        return area
    }

    
    
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        var closest = nums[0]+nums[1]+nums[2]
        var diff = abs(target-closest)
        let numbers = nums.sorted()
        
        for i in 0..<numbers.count - 2 {
            var left = i+1,right = numbers.count-1
            while left < right{
                let sum = numbers[i] + numbers[left] + numbers[right]
                let newDiff = abs(target-sum)
                if newDiff < diff {
                    diff = newDiff
                    closest = sum
                }
                if sum < target {
                    left += 1
                }else{
                    right -= 1
                }
            }
            
        }
        return closest
    }
    
    
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else{
            return []
        }
        let numbers = nums.sorted()
        var result:[[Int]] = [[Int]].init()
        
        for i in 0..<numbers.count-3 {
            for j in i+1..<(numbers.count-2){
                if (j > i+1) && numbers[j] == numbers[j-1] {
                    continue
                }
                var left = j+1, right = numbers.count-1
                while left < right{
                    let sum = numbers[i] + numbers[j] + numbers[left] + numbers[right]
                    if sum == target {
                        var tempArray = [numbers[i],numbers[j],numbers[left],numbers[right]]
                        tempArray = tempArray.sorted()
                        if !result.contains(tempArray){
                            result.append(tempArray)
                        }
                        left += 1
                        right -= 1
                    }else if sum < target {
                        left += 1
                    }else{
                        right -= 1
                    }
                }
            }
        }
        
        return result.count>0 ? result : []
    }
    
    func isPalindrome(_ x: Int) -> Bool {
        let chars:[Character] = [Character](String(x).characters)
        var resultArray:[Character] = [Character].init()
        
        for i in 0..<chars.count {
            resultArray.append(chars[chars.count-1-i])
        }
        var resultString:String = ""
        
        for character in resultArray {
            resultString.append(character)
        }
        
        return resultString == String(x)
        
    }
    
    
    
    
    
    func reverse(_ x: Int) -> Int {
        var result:Int = 0
        var chars:[Character] = [Character](String(x).characters)
        var tempValue:[Character] = [Character].init()
        
        if chars[0] == "-" {
            tempValue = ["-"]
            chars.removeFirst()
        }
        
        for i in 0..<chars.count {
            tempValue.append(chars[chars.count-1-i])
        }
        var tempString:String = ""
        
        for char in tempValue {
            tempString.append(char)
        }
        
        result = Int(tempString)!
        
        
        if result > INT32_MAX || result < -INT32_MAX-1 {
            return 0
        }
        return result
    }
    
    
    
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if  haystack.characters.count < needle.characters.count {
            return -1
        }
        
        if haystack.isEmpty || needle.isEmpty  {
            return 0
        }
        
        let haysArray:[Character] = [Character](haystack.characters)
        let needleArray:[Character] = [Character](needle.characters)
        
        for i in 0..<haysArray.count{
            
            if haysArray[i] == needleArray[0] && (haysArray.count - needleArray.count >= i) {
                let index3 = haystack.index(haystack.startIndex, offsetBy: i)
                let index4 = haystack.index(haystack.startIndex, offsetBy: i+needleArray.count)
                let tempStr = haystack[index3..<index4]
                
                if tempStr == needle {
                    return i
                }
            }
            
        }
        return -1
        
    }
    
    
    func countAndSay(_ n: Int) -> String {
        var tempValue = "1"
        var count = 0
        var result = ""
        var chars:[Character]
        var current:Character
        
        
        if n == 1 {
            return "1"
        }
        
        for _ in 1...(n-1) {
            count = 1
            result = ""
            chars = [Character](tempValue.characters)
            current = chars[0]
            for i in 1..<chars.count {
                if current == chars[i] {
                    count += 1
                    
                }else{
                    result.append("\(count)")
                    result.append(current)
                    count = 1
                    current = chars[i]
                }
            }
            result.append("\(count)")
            result.append(current)
            tempValue = result
        }
        return result
    }
    
    
    
}

