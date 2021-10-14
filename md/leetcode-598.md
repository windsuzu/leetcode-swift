---
title: LeetCode#598 Range Addition II - in Swift
date: 2017-08-19 15:02:02
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
Given an `m * n` matrix M initialized with all 0's and several update operations.

Operations are represented by a 2D array, and each operation is represented by an array with two positive integers a and b, which means M[i][j] should be added by one for all 0 <= i < a and 0 <= j < b.

You need to count and return the number of maximum integers in the matrix after performing all the operations.

給一個 `m * n` 的矩陣 M ，全部由 0 鋪上。

再給一些更新元素，由 2D 陣列組成。　矩陣內含 a, b 兩個正整數，
意為 M 的 `[i][j]` 需要根據 `[a][b]` 的範圍，對每個元素 + 1 。

現在需要求出矩陣 M 中最大的數有多少個。

Example :
``` swift
Input:
m = 3, n = 3
operations = [[2,2],[3,3]]

Output: 4


Explanation:
Initially, M =
[[0, 0, 0],
[0, 0, 0],
[0, 0, 0]]

After performing [2,2], M =
[[1, 1, 0],
[1, 1, 0],
[0, 0, 0]]

After performing [3,3], M =
[[2, 2, 1],
[2, 2, 1],
[1, 1, 1]]

So the maximum integer in M is 2, and there are four of it in M. So return 4.
```

最後矩陣 M 中最大的數為 2 ，並且有 4 個，所以回傳 4

# 解題
最終要找的最大值區塊永遠都會在左上角，所以只要求出最後左上角剩下的區塊就是答案。
這邊透過 min 函式， 來比對最後的 m 跟 n 會是多少。

![range_addition](leetcode-598/range_addition.gif)

``` swift
func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {

    if ops.isEmpty { return m * n }

    var row = 40000
    var col = 40000

    for op in ops {
        row = min(row, op[0])
        col = min(col, op[1])
    }
    
    return row * col
}
```