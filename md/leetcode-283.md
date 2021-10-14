---
title: LeetCode#283 Move Zeroes - in Swift
date: 2017-08-17 14:55:54
tags:
- LeetCode
- Swift
- Array
- Two Pointers
categories: 
- LeetCode
- Swift
- Array
- Two Pointers
---

# 題目


Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

把陣列中的 0 都移到最後面。

For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].

例如 [0, 1, 0, 3, 12] 把 0 都移到後面後會變成 [1, 3, 12, 0, 0]

Note:

You must do this in-place without making a copy of the array.
Minimize the total number of operations.

不能使用額外的陣列，單純修改原本的陣列。


# 解題

把原本的陣列 0 都除掉，算出原本陣列長度與除去 0 之後的長度。
缺少幾個 0 就補到後面去。

![](leetcode-283/filter.gif)

``` swift
func moveZeroes(_ nums: inout [Int]) {
    let count = nums.count
    nums = nums.filter { $0 != 0 }
    let newCount = nums.count
    for _ in 0..<count - newCount {
        nums.append(0)
    }
}
```




# 其他解答

類似 Sort 的方法，把不是 0 的數字跟 0 不斷的對換位置。

![](leetcode-283/change.gif)

``` swift
func moveZeroes(_ nums: inout [Int]) {
    var j = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            let temp = nums[j]
            nums[j] = nums[i]
            nums[i] = temp
            j += 1
        }
    }
}
```











