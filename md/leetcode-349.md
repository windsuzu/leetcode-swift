---
title: LeetCode#349 Intersection of Two Arrays - in Swift
date: 2017-08-21 15:35:06
tags:
- LeetCode
- Swift
- Binary Search
- Hash Table
- Two Pointers
- Sort
categories: 
- LeetCode
- Swift
- Binary Search
- Hash Table
- Two Pointers
- Sort
---

# 題目

Given two arrays, write a function to compute their intersection.
 
算出兩個陣列的 INTERSECT 。

Example:
Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].


# 解題

先把第一個陣列放進 Set 中刪去 Duplicate，
再來找出第二個陣列已經存在 Set 中的數字，存入結果中。

![](leetcode-349/array_intersect.gif)

``` swift
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let values = Set(nums1)
    var result = Set<Int>()
    for num in nums2 {
        if values.contains(num) {
            result.insert(num)
        }
    }
    return Array(result)
}
```