//
//  LeetCode112.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/21.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
 说明: 叶子节点是指没有子节点的节点。
 给定如下二叉树，以及目标和 sum = 22，
 
 5
 / \
 4   8
 /   / \
 11  13  4
 /  \      \
 7    2      1
 返回 true, 因为存在目标和为 22 的根节点到叶子节点的路径 5->4->11->2。
 
 */
class LeetCode112: NSObject {
    public class TreeNode{
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        init(_ val:Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        if sum == root.val && root.left == nil && root.right == nil  {
            return true
        }
        return hasPathSum(root.left,sum-root.val) || hasPathSum(root.right,sum-root.val)
    }
}
