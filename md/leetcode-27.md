---
title: LeetCode#27 Remove Element - in Swift
date: 2017-10-08 18:17:44
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
Given an array and a value, remove all instances of that value in place and return the new length.

Do not allocate extra space for another array, you must do this in place with constant memory.

The order of elements can be changed. It doesn't matter what you leave beyond the new length.

給定陣列和目標值，刪除陣列中所有的目標值，返回新的陣列長度。

可以隨意變動陣列元素，但只可以在同一個陣列操作，不可使用其他多餘的陣列。

---

# 範例
Given input array nums = [3,2,2,3], val = 3
 
Your function should return length = 2, with the first two elements of nums being 2.

題目規定從 [3,2,2,3] 移除所有的 3 ，會得到 [2,2] 長度為 2 。 

---

# 解題

遍尋陣列，只要當下值不等於目標值，就從全新的 index 開始累積一次陣列。

最後返回 index 累積的次數，即為答案。

``` swift
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var index = 0
    for i in 0..<nums.count {
        if nums[i] != val {
            nums[index] = nums[i]
            index += 1
        }
    }
    return index
}
```
