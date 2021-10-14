---
title: LeetCode#35 Search Insert Position - in Swift
date: 2017-10-06 22:14:13
tags:
- LeetCode
- Swift
- Array
- Binary Search
categories:
- LeetCode
- Swift
- Array
- Binary Search
---

# 題目
Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
You may assume no duplicates in the array.

給定排序過陣列和一個目標值，找出該目標值位於陣列的索引值。所以沒有該數，回傳該數應該被插入在什麼位置。

陣列中沒有重複的數字。

---

# 範例
[1,3,5,6], 5 → 2
陣列中 5 的索引為 2

[1,3,5,6], 2 → 1
陣列中沒有 2 ，應該在位置 1 插入

[1,3,5,6], 7 → 4
陣列中沒有 7 ，應該在位置 4 插入

[1,3,5,6], 0 → 0
陣列中沒有 0 ，應該在位置 0 插入

---

# 解題

首先定義陣列範圍 low 跟 high 。
從中間 ( (low + high) / 2) 開始找起，如果中間值等於目標值，回傳中間索引。

如果中間值大於目標值，將 high 向左倒退一位。
如果中間值小於目標值，將 low 向右推進一位。

如果目標值存在於陣列中，會在第一段 if 得出結果，
如果目標值不在陣列中，會隨著 low 的變動最後得到應插入的索引。

``` swift
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var low = 0, high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target { return mid }
        else if nums[mid] > target { high = mid - 1 }
        else { low = mid + 1 }
    }
    return low
}
```