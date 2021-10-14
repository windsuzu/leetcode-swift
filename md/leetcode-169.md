---
title: LeetCode#169 Majority Element - in Swift
date: 2017-09-01 14:17:46
tags:
- LeetCode
- Swift
- Array
- Divide and Conquer
- Bit Manipulation
categories:
- LeetCode
- Swift
- Array
- Divide and Conquer
- Bit Manipulation
---

# 題目

Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.

從陣列中找出出現次數超過一半次數的元素。

可以假設陣列不為空，且一定有一個超過次數元素存在。

---

# 解題

這題其實要求的是就是數學上的「眾數」。

這裡用的是投票算法，鑑於題目規定眾數一定存在。

我們定義一個計數器，歸零時賦予新值成為新的眾數候選。

不為零時，如果新的數字等於候選數，計數器 +1 ，反之 -1 。

![](leetcode-169/boyer_moore_algor.gif)

為什麼這樣做就可以得出解呢，這裡有[投票算法的原理解析](http://blog.csdn.net/kimixuchen/article/details/52787307#原理解析)。

簡單來說，我們可以無視程式運行到計數器最後歸零的過程，純粹只看歸零後的剩餘數字。

``` swift
func majorityElement(_ nums: [Int]) -> Int {
    var count = 1
    var res = nums[0]
    
    for i in 1..<nums.count {
        if count == 0 {
            count += 1
            res = nums[i]
        } else if res == nums[i] {
            count += 1
        } else {
            count -= 1
        }
        
    }
    return res
}
```