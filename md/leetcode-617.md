---
title: LeetCode#617 Merge Two Binary Trees - in Swift
date: 2017-07-25 23:50:46
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
Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
 
給你兩個二元樹，想像當其中一棵樹覆蓋對方時，某些節點可能會重疊，某些可能不會。
 
You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
 
你必須要合併兩棵樹變成一棵新的二元樹。合併規則是這樣：如果兩個節點重疊，那就相加兩個值變成新的節點，如果有一個值不存在，就由不為空的值成為新的節點。

Example 1:
 Input:
```
	Tree 1                     Tree 2
      1                         2
     / \                       / \
    3   2                     1   3
   /                           \   \
  5                             4   7
```
 
Output:
```
 Merged tree:
     3
    / \
   4   5
  / \   \
 5   4   7
```
 
Note: The merging process must start from the root nodes of both trees.
 
合併的過程必須從兩棵樹的最頂端開始。


Definition for a binary tree node.

TreeNode 類別長得像這樣

``` swift
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
```


# 第一次解題 : Accepted
首先針對每個 TreeNode 進行判斷與運算
1. 如果點1或點2都是空值就返回空值
2. 如果點1或點2都不是空值就要將兩個值相加
3. 如果點1是空值 ? 就返回點2 : 返回點1

接著利用遞迴函式 ( Recursive Function ) 的方式
對接下來的左邊節點與右邊節點進行運算得到結果

``` swift
func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    var newNode: TreeNode? = nil
    
    if t1 == nil && t2 == nil {
        return newNode
    } else if t1 != nil && t2 != nil {
        newNode = TreeNode(t1!.val + t2!.val)
    } else {
        newNode = t1 == nil ? t2 : t1
    }
    
    newNode?.left = mergeTrees(t1?.left, t2?.left)
    newNode?.right = mergeTrees(t1?.right, t2?.right)
    
    return newNode
}
```


