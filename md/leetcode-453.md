---
title: LeetCode#453 Minimum Moves to Equal Array Elements - in Swift
date: 2017-08-20 12:42:31
tags:
- LeetCode
- Swift
- Math
categories: 
- LeetCode
- Swift
- Math
---


# 題目
Given a non-empty integer array of size n, find the minimum number of moves required to make all array elements equal, where a move is incrementing n - 1 elements by 1.
 
給數字陣列，找出最少的步數可以把全部的元素變成相等。
每一步，可以把 n - 1 個元素同時加 1 。

Example:
``` swift
Input:
[1,2,3]

Output:
3

Explanation:
Only three moves are needed (remember each move increments two elements):

[1,2,3]  =>  [2,3,3]  =>  [3,4,3]  =>  [4,4,4]

1+1, 2+1 =>  2+1, 3+1 =>  3+1, 3+1 => Answer
```


# 解題

對 n-1 個數字 +1 ，等於對 1 個數字 -1 。
所以最佳的方法是找出最小值，然後算出所有數字對最小值的差。

![](leetcode-453/moves.gif)

``` swift
import Foundation

func minMoves(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var mini = nums[0]
    for n in nums {
        mini = min(mini, n)
    }
    
    var res = 0
    for n in nums {
        res += n - mini
    }
    return res
}
```














