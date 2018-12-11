//
//  LeetCode51.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/15.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 n 皇后问题研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。
 给定一个整数 n，返回所有不同的 n 皇后问题的解决方案。
 
 每一种解法包含一个明确的 n 皇后问题的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。
 
 输入: 4
 输出: [
 [".Q..",  // 解法 1
 "...Q",
 "Q...",
 "..Q."],
 
 ["..Q.",  // 解法 2
 "Q...",
 "...Q",
 ".Q.."]
 ]
 解释: 4 皇后问题存在两个不同的解法。
 */
class LeetCode51: NSObject {
  class  func totalNQueens(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        
        var boards = [[String]]()
        var board = Array(repeating: "", count: n)
        
        dfs(&boards, &board, n, 0)
        
        return boards.count
    }
    
  class  private func dfs(_ boards: inout [[String]], _ board: inout [String], _ n: Int, _ row: Int) {
        if row == n {
            boards.append(Array(board))
            return
        }
        
        
        for col in 0..<n {
            if isValid(board, col, row) {
                board[row] = setRow(col, n)
                dfs(&boards, &board, n, row + 1)
            }
        }
    }
    
 class   private func isValid(_ board: [String], _ col: Int, _ row: Int) -> Bool {
        var c = -1
    
        for i in 0..<row {
            for j in 0..<board[0].count {
                if charAt(board[i], j) == "Q" {
                    c = j
                    break
                }
            }
            
            // check col
            if c == col {
                return false
            }
            
            // check diagnol
            if abs(c - col) == abs(i - row) {
                return false
            }
        }
        
        return true
    }
    
 class   private func charAt(_ str: String, _ index: Int) -> Character {
        return str[str.index(str.startIndex, offsetBy: index)]
    }
    
 class   private func setRow(_ col: Int, _ n: Int) -> String {
        var row = ""
        
        for i in 0..<n {
            if i == col {
                row.append("Q")
            } else {
                row.append(".")
            }
        }
        
        return row
    }
    
    
}
