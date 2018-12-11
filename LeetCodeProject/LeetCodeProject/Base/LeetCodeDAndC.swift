//
//  LeetCodeDAndC.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/12/6.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit

class LeetCodeDAndC: NSObject {
    
    //汉诺塔问题
    var count = 0
    
    override init() {
        super.init()
        
        moved(number: 4, a: "a", b: "b", c: "c")
//        findTarget1(10, metras: [1,3,5,8,10,13,15,18])
//        findTarget2(10, metras: [1,3,5,8,10,13,15,18])
    }
    
    func moved(number:Int,a:String,b:String,c:String) {
        if number == 1 {
            display(number: 1, a: a, b: b)
        }else{
            moved(number: number-1, a: a, b: c, c: b)
            display(number: number, a: a, b: b)
            moved(number: number-1, a: c, b: b, c: a)
        }
    }
    
    func display(number:Int,a:String,b:String) {
        print("第\(count)步，移动第\(number)个塔从\(a)到\(b)")
        count += 1
    }
    
    //递归
    func findTarget2(_ taregt:Int,metras:[Int]) -> Int {
        let res = dfs(metras: metras, left: 0, right: metras.count-1, target: taregt)
        return res
    }
    
    func dfs( metras:[Int],left:Int,right:Int,target:Int) -> Int {
        let mid = (left + right)/2
        if metras[mid] == target {
            return mid
        }else if metras[mid] < target {
            return dfs(metras:metras, left:mid+1, right:right, target:target)
        }else if metras[mid] > target{
            return dfs(metras:metras, left:left, right:mid-1, target:target)
        }
        return 0
    }
    
    //非递归
    func findTarget1(_ target:Int,metras:[Int]) -> Int {
        var left = 0 , right = metras.count-1
        while left<right {
            let mid = (left + right)/2
            if metras[mid] > target {
                right = mid
            }else if metras[mid] < target {
                left = mid
            }else{
                return mid
            }
        }
        return 0
    }
   
    
    
    
    
    
}
