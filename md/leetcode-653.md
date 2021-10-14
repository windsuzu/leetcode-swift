---
title: LeetCode#653 Two Sum IV - Input is a BST - in Swift
date: 2017-08-10 18:36:48
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

Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.
 
給一個二元樹和目標值，找出二元搜尋樹任意存在的兩個節點，若相加可以等於目標值返回 true 。


Example 1:

``` swift
Input:
       5
      / \
     3   6
    / \   \
   2   4   7

Target = 9

Output: True
```

Example 2:

``` swift
Input:
       5
      / \
     3   6
    / \   \
   2   4   7

Target = 28

Output: False
```


# 第一次解題 : 456 ms
將節點依序加入陣列中，並且在每次加入的同時，查看是否有跟目標值相減可求得的答案。

``` swift
func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    var list = [Int]()
    
    func judge(_ node: TreeNode?, _ k: Int) -> Bool {
        guard let node = node else {
            return false
        }
        
        if list.contains(k - node.val) {
            return true
        }
        
        list.append(node.val)
        return judge(node.left, k) || judge(node.right, k)
    }
    
    return judge(root, k)
}
```


# Best Solution 
依照 BST 的特性將節點由小到大加入到陣列中。
接著再用迴圈來搜尋是否有 target 的解。

``` swift
func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    var numbers = [Int]()
    
    func inOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inOrder(root.left)
        numbers.append(root.val)
        inOrder(root.right)
    }
    
    inOrder(root)
    
    var i = 0
    var j = numbers.count - 1
    while i < j {
        if numbers[i] + numbers[j] == k {
            return true
        } else if numbers[i] + numbers[j] < k {
            i += 1
        } else {
            j -= 1
        }
    }
    return false
}

```


