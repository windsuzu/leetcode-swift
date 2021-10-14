---
title: LeetCode#572 Subtree of Another Tree - in Swift
date: 2017-09-25 15:33:46
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
Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.

給兩個不為空的二元樹 s 和 t 。
驗證 t 是否相同於 s 的子樹，必須擁有相同的架構和值。
s 子樹由 s 組成，所以 s 也可以視作 s 子樹。

---

# 範例
## Example 1:

Given tree s:
``` swift
       3
      / \
     4   5
    / \
   1   2
```
Given tree t:
``` swift
     4
    / \
   1   2

Return true, because t has the same structure and node values with a subtree of s.
```

回傳 true ，因為 t 可以相同於 s 子樹。

## Example 2:

Given tree s:
``` swift
       3
      / \
     4   5
    / \
   1   2
  /
 0
```
Given tree t:
``` swift
     4
    / \
   1   2

Return false.
```

回傳 false ，因為 t 並沒有相同於任何 s 子樹。

---

# 解題

利用 isSame 函式去判斷兩棵樹是否完全相等。

如果 s 為空 ， t 也應該為空。

如果皆不為空，兩個節點的值應該要相等，相等繼續往左右節點做 isSame 函式，不相等則回傳 false 。

``` swift
func isSame(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil {
        return t == nil
    }
    if let s = s, let t = t, s.val == t.val {
        return isSame(s.left,t.left) && isSame(s.right,t.right)
    }
    return false
}
```

有了 isSame 函式，現在只要確認 s 子樹 是否有節點相等於 t 樹的根節點。
如果開頭相同，就可以執行 isSame 函式。

所以看到主函式，若 s 為空 ， t 也應該為空。
若 s 根節點相等於 t 根節點，確認 t 是否相等於 s 或 s左子樹 或 s右子樹。

若開頭不同，往下找有沒有其他 s 的節點為 t 的根節點。

``` swift
func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil {
        return t == nil
    }
    if let s = s, let t = t, s.val == t.val {
        return isSame(s,t) || isSame(s.left,t) || isSame(s.right,t)
    }
    return isSubtree(s?.left,t) || isSubtree(s?.right,t)
}
```




