//
//  AppDelegate.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/7/25.
//  Copyright © 2018年 lmg. All rights reserved.
//

import UIKit
/*
 [[QLYStatistic shareStatistic] statisticWithOperateKeyString:cloud_detection_search];
 
 */
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    /*
     1 1 2 3 5 8 13
     
     */
    func Fibonacci( number:Int) -> Int {
        
        
        if number == 0 {
            return 1
        }
        if number == 1 {
            return 1
        }
        
        return Fibonacci(number: number-1) + Fibonacci(number: number-2)
        
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let tempString = "hello world"
        let subStartStr = tempString.js_subStringFrom(from: 3)
        let subEndStr = tempString.js_subStringTo(to: -3)
        let rangeStr = tempString.js_subStringWithRange(from: 2, to: 4)
        
        
        
        
        
        let returnValue =  LeetCode70.climbStairs(44)
//        LeetCode64.minPathSum([
//            [1,3,1],
//            [1,5,1],
//            [4,2,1]
//            ])
//        LeetCode79.exist([["A","B","C","E"],
//                          ["S","F","C","S"],
//                          ["A","D","E","E"]], "ABCCED")
//        LeetCode58.lengthOfLastWord(" ")
//        LeetCode3.lengthOfLongestSubstring("pwwkew")
//        LeetCode11.maxArea([1,8,6,2,5,4,8,3,7])
//        LeetCode45.jump([2,3,1,1,4])
//        LeetCode8.myAtoi(str: "42")
        LeetCode34.searchRange([1], 1)
        
        //反向遍历
//        for j in stride(from: temp.count-1, to: -1, by:-1) {
//            print(j)
//        }
//
//        for i in (0..<temp.count).reversed() {
//            print(i)
//        }
//
//        for (index,value) in temp.enumerated().reversed() {
//            print(index,value)
//        }
    

        //正向遍历
//        for i in stride(from: 0, to: temp.count, by: 1){
//            print(i)
//        }
//
//        for j in 0..<temp.count {
//            print(j)
//        }
//
//        for (index,value) in temp.enumerated() {
//            print(index,value)
//        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension String {
    public func js_subStringFrom(from index:Int)->String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex...]
            return String(subString)
        }
        return self
    }
    
   public func js_subStringTo(to index:Int) -> String {
        if self.count > index {
            let endIndex = self.index(self.endIndex, offsetBy: index)
            let subString = self[..<endIndex]
            return String(subString)
        }
        return self
    }
    
  public  func js_subStringWithRange(from:Int,to:Int) -> String {
        if self.count > from && self.count > to && to > from{
            let startIndex = self.index(self.startIndex, offsetBy: from)
            let endIndex = self.index(self.startIndex, offsetBy: to)
            let rangeStr = self[startIndex...endIndex]
            return String(rangeStr)
        }
        return self
    }

    
    
}
