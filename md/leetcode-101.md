---
title: LeetCode#101 Symmetric Tree - in Swift
date: 2017-10-13 15:42:17
tags:
- LeetCode
- Swift
- Tree
- Depth-first Search
- Breadth-first Search
categories:
- LeetCode
- Swift
- Tree
- Depth-first Search
- Breadth-first Search
---

# 題目
Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

給定二元樹，驗證他是否對稱。

---

# 範例

For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
``` swift
       1
      / \
     2   2
    / \ / \
   3  4 4  3
```
 
But the following [1,2,2,null,3,null,3] is not:
``` swift
       1
      / \
     2   2
      \   \
       3   3
```

---

# 解題

從根節點左右開始驗證，若左右皆為 nil 則為對稱，若只有某一邊 nil 則不為對稱。

若兩邊都存在，比對值是否相同，相同則繼續往下比對，

比對左子樹的左節點，和右子樹的右節點是否相同，

再比對左子樹的右節點，和右子樹的左節點是否相同，

直到結束，返回答案值。

``` swift
func isSymmetric(_ root: TreeNode?) -> Bool {
    var res = true
    
    func checking(_ left: TreeNode?, _ right: TreeNode?) {
        if left == nil && right != nil { res = false; return }
        if left != nil && right == nil { res = false; return }
        if left == nil && right == nil { return }
        if left != nil && right != nil {
            if left!.val != right!.val {
                res = false
                return
            } else {
                checking(left?.left, right?.right)
                checking(left?.right, right?.left)
            }
        }
    }
    checking(root?.left, root?.right)
    return res
}
```


