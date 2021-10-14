---
title: LeetCode#257 Binary Tree Paths - in Swift
date: 2017-10-12 15:01:45
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
Given a binary tree, return all root-to-leaf paths.

給一個二元樹，返回所有根節點到葉節點的路徑。

---

# 範例

given the following binary tree:

``` swift
       1
     /   \
    2     3
   /  \
  4    5
```

All root-to-leaf paths are:

["1->2->4", "1->2->5", "1->3"]

根據上圖，總共有兩個根節點到葉節點的路徑，分別為 "1->2->4" 以及 "1->2->5" 和 "1->3"。

---

# 解題

以範例來說，利用 dps 一開始會跑根節點 1 到 2 ，給新路徑 "1->"
當前節點為 2 時， 當前路徑為 "1->"
下一個到 4 時， 當前路徑為 "1->2->"
且 4 沒有任何子節點了，所以更新路徑為 "1->2->4" 並且加入陣列中

回到 2 的分岔，當前路徑為 "1->"
下一個到 5 時， 當前路徑為 "1->2->"
且 5 沒有任何子節點了，所以更新路徑為 "1->2->5" 並且加入陣列中

回到 1 的分岔，
下一個到 3 時，當前路徑為 "1->"
且 3 沒有任何子節點了，所以更新路徑為 "1->3" 並且加入陣列中

``` swift
func binaryTreePaths(_ root: TreeNode?) -> [String] {
    if root == nil { return [] }
    var res = [String]()
    search(root, "", &res)
    return res
}

func search(_ root: TreeNode?, _ currentPath: String, _ res: inout [String]) {
    if root?.left == nil && root?.right == nil { res.append("\(currentPath)\(root!.val)") }
    if root?.left != nil { search(root?.left, "\(currentPath)\(root!.val)->", &res) }
    if root?.right != nil { search(root?.right, "\(currentPath)\(root!.val)->", &res) }
}
```