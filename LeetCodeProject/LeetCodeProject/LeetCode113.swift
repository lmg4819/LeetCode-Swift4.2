//
//  LeetCode113.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/21.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。
 明: 叶子节点是指没有子节点的节点。
 
 示例:
 给定如下二叉树，以及目标和 sum = 22，
 
 5
 / \
 4   8
 /   / \
 11  13  4
 /  \    / \
 7    2  5   1
 返回:
 
 [
 [5,4,11,2],
 [5,8,4,5]
 ]
 */
class LeetCode113: NSObject {
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
    
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var res = [[Int]].init()
        var path = [Int].init()
        dfs(root: root, res: &res, path: &path, sum: sum)
        return res
    }
    
    func dfs(root: TreeNode?,res:inout [[Int]],path: inout [Int],sum:Int) {
        
        guard let root = root else {
            return
        }
        
        path.append((root.val))
        
        if sum == root.val && root.left == nil && root.right == nil {
            res.append(path)
            return
        }

        
        var pathLeft = path
        var pathRight = path
        
        dfs(root: root, res: &res, path: &pathLeft, sum: sum-root.val)
        dfs(root: root, res: &res, path: &pathRight, sum: sum-root.val)
    
    }
}
