---
title: LeetCode#104 Maximum Depth of Binary Tree - in Swift
date: 2017-08-06 14:20:39
tags:
- LeetCode
- Swift
- Tree
- Depth-first Search
categories: 
- LeetCode
- Swift
- Tree
- Depth-first Search
---

# 題目

Given a binary tree, find its maximum depth.
 
The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
找出二元樹的最大深度。
 
Example :
``` swift
 Input:
        3
       / \
      9  20
     / \
    15  7
         \
         10
 
 Output: 4
```
從根節點 3 走到 10 的距離最長，有 4 個節點。


# 第一次解題 : 52 ms

建立一個 array 用來擺放下一步該走的節點，跟著存在的節點不斷的往下走，直到沒有節點。

``` swift
func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    var depth = 0
    var temp = [root]
    while !temp.isEmpty {
        for node in temp {
            temp.removeFirst()
            if let node = node?.left {
                temp.append(node)
            }
            if let node = node?.right {
                temp.append(node)
            }
        }
        depth += 1
    }
    return depth
}
```
``` swift
[3]
--- next level ---
[9, 20]
[20, 15, 7]
--- next level ---
[15, 7]
[7]
--- next level ---
[10]
--- next level ---
```


# Best Solution with Recursive Function : 32 ms
``` swift
func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    return 1 + max(maxDepth(root!.left), maxDepth(root!.right))
}
```
``` swift
 1 represent the root level = 1
 
 level 2 -> 1 + max(1, 1) // 9, 20 ✔
 
 level 3 -> 2 + max(1, 1) // 15, 7 ✔
 level 3 -> 2 + max(0, 0) // nothing under 20
 
 level 4 -> 3 + max(0, 0) // nothing under 15
 level 4 -> 3 + max(0, 1) // nil, 10 ✔ -> answer = 4
 
 level 5 -> 4 + max(0, 0) // nothing under 10

```
