//
//  leetCode15.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/7.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 
 
 */
class LeetCode15: NSObject {
  class  func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var res = [[Int]].init()
        guard nums.count >= 3 else {
            return res
        }
        
        let numbers = nums.sorted()
        
        for i in 0..<numbers.sorted().count-2 {
            if i != 0 && numbers[i] == numbers[i-1]{
                continue
            }
            var left = i+1,right = numbers.count-1
            while left < right{
                let sum = numbers[i]+numbers[left]+numbers[right]
                if sum == 0{
                    let temp = [numbers[i],numbers[left],numbers[right]]
                    
                    if !res.contains(temp){
                        res.append(temp)
                    }
                }
                
                if sum > 0{
                    right -= 1
                }else{
                    left += 1
                }
            }
            
        }
        return res
    }
}
/*
 
 swift版本答案超时，因为效率太低
 C++
 class Solution
 {
 public:
 vector<vector<int> > threeSum(vector<int> &num)
 {
 vector<vector<int>> rs;
 int len = num.size();
 if(len == 0)
 return rs;
 sort(num.begin(),num.end());
 for(int i = 0; i < len; i++)
 {
 int j = i + 1;
 int k = len - 1;
 if(i != 0 && num[i] == num[i - 1])//如果遇到重复元素的情况，避免多次考虑
 continue;
 while(j < k)//对于每一个num[i]从i之后的元素中,寻找对否存在三者之和为0的情况
 {
 if(num[i] + num[j] +num[k] == 0)//当三者之和为0的情况
 {
 rs.push_back({num[i],num[j],num[k]});
 j++;//当此处的j,k满足时，别忘了向前/向后移动，判断下一个是否也满足
 k--;
 while(j < k && num[j] == num[j - 1])//如果遇到j重复的情况，也要避免重复考虑
 j++;
 while(j < k && num[k] == num[k + 1])//如果遇到k重复的情况，也要避免重复考虑
 k--;
 }
 else if(num[i] + num[j] + num[k] < 0)//三者之和小于0的情况，说明num[j]太小了，需要向后移动
 j++;
 else//三者之和大于0的情况，说明num[k]太大了，需要向前移动
 k--;
 }
 }
 return rs;
 
 }
 
 };
 

 
 */
