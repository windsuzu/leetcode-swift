---
title: LeetCode#226 Invert Binary Tree - in Swift
date: 2017-08-08 13:10:25
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

Invert a binary tree.

翻轉二元樹。

```
     4
   /   \
  2     7
 / \   / \
1   3 6   9
```

to

```
     4
   /   \
  7     2
 / \   / \
9   6 3   1
```

# Trivia

This problem was inspired by this original tweet by Max Howell:

Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so fuck off.

Homebrew 的開發者 Max Howell 在[推特發文](https://twitter.com/mxcl/status/608682016205344768) :
Google: 雖然我們 90% 工程師都在用你寫的軟體（Homebrew），但你不能在白板上反轉二元樹，所以滾蛋。



# 第一次解題 : 19 ms

把每層的左右換邊就好
``` swift
       4
     /   \
    2     7
   / \   / \
  1   3 6   9
```

第一次轉節點 2 跟 7

``` swift
       4
     /   \
    7     2
   / \   / \
  6   9 1   3
```

第二次轉 6 9

``` swift
       4
     /   \
    7     2
   / \   / \
  9   6 1   3
```

第三次轉 1 3

``` swift
       4
     /   \
    7     2
   / \   / \
  9   6 3   1
```

``` swift
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    let temp = root.left
    root.left = root.right
    root.right = temp
    
    invertTree(root.left)
    invertTree(root.right)
    
    return root
}
```









