---
title: LeetCode#606 Construct String from Binary Tree - in Swift
date: 2017-08-16 15:05:08
tags:
- LeetCode
- Swift
- String
- Tree
categories: 
- LeetCode
- Swift
- String
- Tree
---

# 題目

> You need to construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way.
 
> The null node needs to be represented by empty parenthesis pair "()". And you need to omit all the empty parenthesis pairs that don't affect the one-to-one mapping relationship between the string and the original binary tree.

> 將二元樹化為字串，格式為 root(left(left))(right) ，
空的節點表示為()，但不會影響到其他節點的空節點得省略。
 

* Example 1:
`[1,2,3,4]` 可以得出 `1(2(4)())(3()())` ，消除不必要的空節點可以得到 `1(2(4))(3)`
``` swift
Input: Binary tree: [1,2,3,4]
       1
     /   \
    2     3
   /
  4

Output: "1(2(4))(3)"
```


* Example 2:
跟第一題差不多，多的是不能省略 4 前面的空節點。
``` swift
Input: Binary tree: [1,2,3,null,4]
       1
     /   \
    2     3
     \
      4

Output: "1(2()(4))(3)"
```

# 解題

利用遞迴求出左方節點與右方節點應該回傳的字串。
最後將字串組合起來 root(left)(right)。

<img src="leetcode-606/tree2str.gif" alt="tree2str" style="height: 450px;"/>

``` swift
func tree2str(_ t: TreeNode?) -> String {
    guard let t = t else {
        return ""
    }
    let result = "\(t.val)"
    let left = tree2str(t.left)
    let right = tree2str(t.right)
    
    if left.isEmpty && right.isEmpty { return result }
    if left.isEmpty { return "\(result)()(\(right))" }
    if right.isEmpty { return "\(result)(\(left))"}
    return "\(result)(\(left))(\(right))"
}
```





