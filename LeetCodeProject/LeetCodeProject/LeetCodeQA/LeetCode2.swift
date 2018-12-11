//
//  LeetCode2.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/9.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定两个非空链表来表示两个非负整数。位数按照逆序方式存储，它们的每个节点只存储单个数字。将两数相加返回一个新的链表。
 
 你可以假设除了数字 0 之外，这两个数字都不会以零开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */
class LeetCode2: NSObject {

    public class ListNode{
        var val:Int
        var next:ListNode?
        init(_ val:Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?{
        
        var carray = 0,l1 = l1,l2 = l2
        let res = ListNode.init(0)
        var node = res
        
        while l1 != nil || l2 != nil || carray != 0 {
            if l1 != nil {
                carray += l1!.val
                l1 = l1?.next
            }
            if l2 != nil {
                carray += l2!.val
                l2 = l2?.next
            }
            node.next = ListNode.init(carray%10)
            node = node.next!
            carray = carray/10
        }
        
        return res.next
    }
    
    
}
