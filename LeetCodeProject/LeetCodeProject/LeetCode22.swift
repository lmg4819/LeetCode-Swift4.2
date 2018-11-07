//
//  LeetCode22.swift
//  LeetCodeProject
//
//  Created by lmg on 2018/11/7.
//  Copyright © 2018 lmg. All rights reserved.
//

import UIKit
/*
 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
 例如，给出 n = 3，生成结果为：
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 
 (
 ((
 ()
 
 
 */
class LeetCode22: NSObject {
   class func generateParenthesis(_ n: Int) -> [String] {
        var res:[String] = [String].init()
        var path:String = String.init()
        backTrace(left: n, right: n, res: &res, path: &path)
        return res
    }
    ///*left、right分别是左右括号剩下的括号数*/
  class  func backTrace(left:Int,right:Int,res:inout [String],path: inout String) {
        if left > right {
            return
        }
        if left == 0 && right == 0{
            res.append(path)
            return
        }else
        {
            if left > 0{
                path.append("(")
                backTrace(left: left-1, right: right, res: &res, path: &path)
            }
            if right > 0{
                path.append(")")
                backTrace(left: left, right: right-1, res: &res, path: &path)
            }
        }
    }
    
}
/*
 
 vector<string> generateParenthesis(int n)
      {
          vector<string> res;
          generateDFS(n,n,"",res);
          return res;
      }
 
      /*left、right分别是左右括号剩下的括号数*/
      void generateDFS(int left,int right,string temp,vector<string> &res)
      {
         if(left>right) return;
        if(left==0&&right==0)
             res.push_back(temp);
        else
         {
           if(left>0)
                  generateDFS(left-1,right,temp+'(',res);
            if(right>0)
                 generateDFS(left,right-1,temp+')',res);
         }
     }
 */
