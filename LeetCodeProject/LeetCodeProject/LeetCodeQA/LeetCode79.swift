//
//  LeetCode79.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/15.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个二维网格和一个单词，找出该单词是否存在于网格中。
 
 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
 
 board =
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 
 给定 word = "ABCCED", 返回 true.
 给定 word = "SEE", 返回 true.
 给定 word = "ABCB", 返回 false.
 */
class LeetCode79: NSObject {
    class func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        let m = board.count
        let n = board[0].count
        var visited = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
        var wordContent = [Character](word.characters)
        for i in 0..<m {
            for j in 0..<n{
                if board[i][j] == wordContent[0] && _dfs(board: board, wordContent: wordContent, m: m, n: n, i: i, j: j, visited:&visited, index: 0){
                    return true
                }
            }
        }
        return false
    }
    
    private  class func _dfs(board:[[Character]],wordContent:[Character],  m: Int, n: Int, i: Int,  j: Int,  visited:inout [[Bool]],index:Int)->Bool{
        if index == wordContent.count {
            return true
        }
        
        guard i >= 0 && i < m && j >= 0 && j < n else {
            return false
        }
        
        guard !visited[i][j] && board[i][j] == wordContent[index] else {
            return false
        }
        visited[i][j] = true
        
        if _dfs(board: board, wordContent: wordContent, m: m, n: n, i: i+1, j: j, visited: &visited, index: index + 1) || _dfs(board: board, wordContent: wordContent, m: m, n: n, i: i-1, j: j, visited: &visited, index: index + 1) || _dfs(board: board, wordContent: wordContent, m: m, n: n, i: i, j: j+1, visited: &visited, index: index + 1) || _dfs(board: board, wordContent: wordContent, m: m, n: n, i: i, j: j-1, visited: &visited, index: index + 1){
            return true
        }
        
        visited[i][j] = false
        return false
    }
}
