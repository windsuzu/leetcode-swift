---
title: LeetCode#628 Maximum Product of Three Numbers - in Swift
date: 2017-09-10 00:00:03
tags:
- LeetCode
- Swift
- Array
- Math
categories:
- LeetCode
- Swift
- Array
- Math
---

# 題目
Given an integer array, find three numbers whose product is maximum and output the maximum product.

給一個整數陣列，找出三個數字他們相乘會是最大的數字。

Note:
1. The length of the given array will be in range [3,10^4] and all elements are in the range [-1000, 1000].
2. Multiplication of any three numbers in the input won't exceed the range of 32-bit signed integer.

整數陣列的範圍為 [3, 10^4] ，然後所有元素的值的範圍為 [-1000, 1000] 。
算出來的乘積答案不會超過 32 位元正負號整數。


Example 1:
``` swift
Input: [1,2,3]
Output: 6
```
剛好陣列只有三個數字，最大乘積即是 6 。


Example 2:
``` swift
Input: [1,2,3,4]
Output: 24
```
陣列中最大的乘積是 `2 * 3 * 4` = 24

---

# 解題

一開始想到一個直觀又懶的解法，直接把陣列先重新排序，
然後抓最大的三個數字就可以得到最大乘積。

但是事情沒有那麼單純，題目規定數字範圍在 -1000 到 1000 當中，
也就是如果最小的兩個數字的絕對值比第二、第三大，那在相乘最大數字，就會得到更大的乘積。

所以必須要找出兩種可能，並且比較誰比較大，即是答案。

![](leetcode-628/maxproduct.gif)


``` swift
func maximumProduct(_ nums: [Int]) -> Int {
    let nums = nums.sorted(by: >)
    return max(nums[0] * nums[1] * nums[2],
               nums[0] * nums[nums.count - 1] * nums[nums.count - 2])
}
```




