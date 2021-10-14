---
title: LeetCode#530 Minimum Absolute Difference in BST - in Swift
date: 2017-08-23 12:11:56
tags:
- LeetCode
- Swift
- Binary Search Tree
categories: 
- LeetCode
- Swift
- Binary Search Tree
---

# 題目

Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.
 
找出二元樹任意兩點，差距最小的值。

Example:
``` swift
Input:

   1
    \
     3
    /
   2

Output:
1

Explanation:
The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).
```

最小的差是 1 ，來自 2 和 1 (或 3 和 2)


# 解題

BST 特性由小到大取節點，比較每次的差值與目前最小值。

![](leetcode-530/minimum.gif)

``` swift
func getMinimumDifference(_ root: TreeNode?) -> Int {
    var numbers = [Int]()
    var res = Int.max
    
    func inOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inOrder(root.left)
        
        if let last = numbers.last {
            res = min((root.val - last), res)
        }
        numbers.append(root.val)
        inOrder(root.right)
    }
    inOrder(root)
    return res
}
```


