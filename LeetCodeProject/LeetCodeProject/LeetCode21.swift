//
//  LeetCode21.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/9.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 
 */


class LeetCode21: NSObject {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else{

            return l2
        
        }
        guard let l2 = l2 else {
            
            return l1

        }
        if l1.val >= l2.val {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
            
        }else{
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        }
        
    }
    //    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    //
    //        if l1 == nil && l2 == nil {
    //           return nil
    //        }
    //        var returnResult = ListNode.init(0)
    //        var listOne = l1 , listTwo = l2
    //        var tail = returnResult
    //
    //
    //        while listOne != nil && listTwo != nil {
    //            if listOne!.val < listTwo!.val {
    //                tail.next = listOne
    //                listOne = listOne?.next
    //                tail = tail.next!
    //
    //            }else {
    //                tail.next = listTwo
    //                listTwo = listTwo?.next
    //                tail = tail.next!
    //            }
    //        }
    //
    //        if listOne == nil {
    //            tail.next = listTwo
    //        }else if listTwo == nil {
    //            tail.next = listOne
    //        }
    //        return returnResult.next
    //    }
}


