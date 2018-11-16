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
 常见的时间复杂度有：
 常数阶：O(1)
 对数阶：O(log2n)
 线性阶：O(n)
 线性对数阶：O(nlog2n)
 平方阶：O(n^2)
 立方阶：O(n^3)
 K次方阶：O(n^K)
 指数阶：O(2^n)
所有的排序方法：
1.插入排序   O(n^2) 稳定
2.选择排序   O(n^2) 不稳定
3.冒泡排序   O(n^2) 稳定
4.快速排序   O(nlogn) 平均时间, O(n2) 最坏情况; 对于大的、乱序串列一般认为是最快的已知排序 不稳定
5.堆排序     O(nlogn) 不稳定
6.归并排序   O(n log n); 需要 O(n) 额外存储空间 稳定
7.希尔排序   O(nlogn) 不稳定
8.二叉树排序 O(nlogn); 需要 O(n) 额外存储空间 稳定
9.桶排序    O(n); 需要 O(k) 额外存储空间 稳定
10.计数排序  O(n+k); 需要 O(n+k) 额外存储空间，k为序列中Max-Min+1 稳定
11.基数排序  O(n·k); 需要 O(n) 额外存储空间 （K为特征个数）不稳定
 
 
 分治法的基本思想是：将原问题分解为若干个规模更小但结构与原问题相似的子问题，递归的解这些子问题，然后将这些子问题的解组合为原问题的解
 
 */
//选择排序  O(n^2) 不稳定
func selectSort(_ nums:inout [Int]) -> [Int] {
    for i in 0..<nums.count-1 {
        for j in i+1..<nums.count {
            if nums[j] < nums[i]{
                (nums[i],nums[j]) = (nums[j],nums[i])
            }
        }
    }
    return nums
}

//插入排序 O(n^2) 稳定
func insertSort(_ nums:inout [Int]) ->[Int] {
    for i in 1..<nums.count {
        for j in (1...i).reversed() {
            if nums[j] < nums[j-1]{
                (nums[j-1],nums[j]) = (nums[j],nums[j-1])
            }
        }
    }
    return nums
}

//冒泡排序 O(n^2) 稳定
func bubbleSort(_ nums:inout [Int]) -> [Int] {
    for i in 0..<nums.count {
        for j in 0..<nums.count-i-1{
            if nums[j] > nums[j+1]{
                (nums[j],nums[j+1]) = (nums[j+1],nums[j])
            }
        }
    }
    return nums
}

/*2 1 5 9 0 6 8 7 3
 0 1 5 9 0 6 8 7 3
 0 1 5 9 5 6 8 7 3
 0 1 9 9 5 6 8 7 3
 {0 1 2} {9 5 6 8 7 3}
 */
//快速排序 O(nlogn) 平均时间, O(n2) 最坏情况; 对于大的、乱序串列一般认为是最快的已知排序 不稳定
func fastSort(_ nums:inout [Int]) -> [Int] {
    sort(&nums, left: 0, right: nums.count-1)
    return nums
}

func sort(_ nums:inout [Int],left:Int,right:Int) {
    if left >= right {
        return
    }
    var i = left,j=right,key = nums[left]
    while i<j {
        while i<j && key<=nums[j]{
            j -= 1
        }
        nums[i] = nums[j]
        
        while i<j && key>=nums[i]{
            i += 1
        }
        nums[j] = nums[i]
    }
    nums[i] = key
    sort(&nums, left: left, right: i-1)
    sort(&nums, left: i+1, right:right)
}

//堆排序 O(nlogn) 不稳定
/*
 [4,6,8,5,9]
 4
 6 8
 5 9
 
 
 
 
 
 */

//希尔排序 O(nlogn) 不稳定
func shellSort(_ nums:inout [Int])->[Int]{
    
    var gap = nums.count
    while gap > 0 {
        for i in gap..<nums.count {
            var j = i
            while j-gap >= 0 && nums[j] < nums[j-gap]{
                (nums[j-gap],nums[j]) = (nums[j],nums[j-gap])
                j -= gap
            }
        }
        gap = gap/2
    }
    return nums
}
//归并排序 O(n log n); 需要 O(n) 额外存储空间 稳定



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var temp = [49,38,65,97,76,13,27,49,55,4]
//        mergeSort(&temp)
//        shellSort(&temp)
//        heapSort(&temp)
//        fastSort(&temp)
//        bubbleSort(&temp)
//        insertSort(&temp)
//        selectSort(&temp)
    }
    
   
    
    
    func BinarySearch(_ nums:[Int],target:Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var left = 0 ,right = nums.count - 1
        while left<right {
            let mid = (left + right)/2
            if nums[mid] > target {
                left = mid
            }else if nums[mid] < target {
                right = mid
            }else {
                return mid
            }
            
        }
        return 0
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

