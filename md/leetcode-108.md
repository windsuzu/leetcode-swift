---
title: LeetCode#108 Convert Sorted Array to Binary Search Tree - in Swift
date: 2017-09-20 13:52:50
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

Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

給定一個升序陣列，把它轉換成高度平衡的二元搜尋樹。

---

# 範例

``` swift
Input : [1,2,3,4,5]

Output :

        3
      /   \
     2	   5
    /	  /
   1	 4
```

必須要轉換成高度平衡的二元搜尋樹。

---

# 解題

先取得陣列中間值作為根節點。

再將陣列切為小於根節點的一半，與大於根節點的另一半。

再從這兩個陣列重新遞迴一遍剛剛的步驟，就可以得到高度平衡的 BST 。

![](leetcode-108/array2bst.gif)

``` swift
func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    if nums.count == 0 {
        return nil
    }
    
    let mid = nums[nums.count/2]
    
    var tree = TreeNode(mid)
    
    let leftnums = Array(nums[0..<nums.count/2])
    let rightnums = Array(nums[nums.count/2 + 1..<nums.count])
    
    tree.left = sortedArrayToBST(leftnums)
    tree.right = sortedArrayToBST(rightnums)
    
    return tree
}
```