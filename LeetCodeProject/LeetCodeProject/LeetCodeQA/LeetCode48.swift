//
//  LeetCode48.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/7.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给定一个 n × n 的二维矩阵表示一个图像。
 
 将图像顺时针旋转 90 度。
 
 给定 matrix =
 [
 [1,2,3],
 [4,5,6],
 [7,8,9]
 ],
 
 原地旋转输入矩阵，使其变为:
 [1,4,7]
 [2,5,8]
 [3,6,9]
 
 [7,4,1]
 [8,5,2]
 [9,6,3]
 
 
 
 [7,4,1],
 [8,5,2],
 [9,6,3]
 ]
 
 给定 matrix =
 [
 [ 5, 1, 9,11],
 [ 2, 4, 8,10],
 [13, 3, 6, 7],
 [15,14,12,16]
 ],
 
 原地旋转输入矩阵，使其变为:
 [
 [15,13, 2, 5],
 [14, 3, 4, 1],
 [12, 6, 8, 9],
 [16, 7,10,11]
 ]
 */
//执行用时:36 ms
class LeetCode48: NSObject {
    class func rotate(_ matrix: inout [[Int]]) {
       
        for i in 0..<matrix.count {
            for j in i+1..<matrix.count{
                (matrix[i][j],matrix[j][i]) = (matrix[j][i],matrix[i][j])
            }
            matrix[i].reverse()
        }
        print(matrix)
    }
}


/*
 
 //执行用时:4ms
 class Solution {
 public:
 void rotate(vector<vector<int> > &matrix) {
 int n = matrix.size();
 for (int i = 0; i < n; ++i) {
 for (int j = i + 1; j < n; ++j) {
 swap(matrix[i][j], matrix[j][i]);
 }
 reverse(matrix[i].begin(), matrix[i].end());
 }
 }
 };
 
 
 */
