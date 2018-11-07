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
     给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
     
     注意：答案中不可以包含重复的三元组。
     
     例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
     
     满足要求的三元组集合为：
     [
     [-1, 0, 1],
     [-1, -1, 2]
     ]
     */

    
    
    /*
     
     
     */
    
    
//    func permute(_ nums:[Int]) -> [[Int]] {
//        var res = [[Int]].init()
//        var path = [Int].init()
//        var isVisited = [Bool].init(repeating: false, count: nums.count)
//        dfs(&res, &path, &isVisited, nums)
//
//        return res
//    }
//
//    func dfs(_ res: inout [[Int]],_ path: inout [Int], _ isVisited:inout [Bool], _ nums:[Int]) {
//        guard path.count != nums.count else{
//            res.append(path)
//            return
//        }
//        for (i,num) in nums.enumerated() where !isVisited[i] {
//            path.append(num)
//            isVisited[i] = true
//            dfs(&res, &path, &isVisited, nums)
//            isVisited[i] = false
//            path.removeLast()
//        }
//
//    }
   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var temp = [[ 5, 1, 9,11],
                    [ 2, 4, 8,10],
                    [13, 3, 6, 7],
                    [15,14,12,16]]
        
        LeetCode48.rotate(&temp)
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

