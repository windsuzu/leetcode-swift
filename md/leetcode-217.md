---
title: LeetCode#217 Contains Duplicate - in Swift
date: 2017-09-07 14:52:59
tags:
- LeetCode
- Swift
- Array
- Hash Table
categories:
- LeetCode
- Swift
- Array
- Hash Table
---

# 題目
Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 
給一組整數陣列，找出陣列是否包含重複的數字。

如果有重複，則回傳 true ，如果每一個整數都只出現一次，回傳 false 。

Example :
``` swift
Input : [1,2,3]
Output : false


Input : [1,1,2]
Output : true
```

---

# 解題

Swift 的 Set 類別會自動挑選掉重複的整數。

只要將原本的 Array 跟轉為 Set 後比較他們的長度，就可以知道有沒有重複。

![](leetcode-217/set.gif)

``` swift
func containsDuplicate(_ nums: [Int]) -> Bool {
    return Set(nums).count != nums.count
}
```