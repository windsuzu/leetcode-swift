---
title: LeetCode#563 Binary Tree Tilt - in Swift
date: 2017-08-30 14:20:16
tags:
- LeetCode
- Swift
- Tree
categories: 
- LeetCode
- Swift
- Tree
---

# 題目

Given a binary tree, return the tilt of the **whole tree**.
 
The tilt of a **tree node** is defined as the **absolute difference** between the sum of all left subtree node values and the sum of all right subtree node values. Null node has tilt 0.

The tilt of the **whole tree** is defined as the sum of all nodes' tilt.


計算一個二元樹的傾斜值，一個節點的傾斜值來自其左右兩邊子樹個別總和起來相減的絕對值。

現在算出所有節點的傾斜值，並且加總起來。

Example:
``` swift
Input:
   1
 /   \
2     3

Output: 1

Explanation:
Tilt of node 2 : 0
Tilt of node 3 : 0
Tilt of node 1 : |2-3| = 1
Tilt of binary tree : 0 + 0 + 1 = 1
```

2 、 3 沒有任何子節點，所以傾斜值為 0 ， 1 的傾斜值為 |2 - 3| = 1 ，加總起來為 1 。



# 解題

從葉節點開始，算出傾斜值，並且將該值加回去其父節點的左或右，不斷遞迴回到根節點。

![](leetcode-563/postorder.gif)

``` swift
func findTilt(_ root: TreeNode?) -> Int {
    var res = 0
    
    func postorder(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var left = postorder(root.left)
        var right = postorder(root.right)
        
        res += Int(abs(left - right))
        
        return left + right + root.val
    }
    postorder(root)
    
    return res
}
```










