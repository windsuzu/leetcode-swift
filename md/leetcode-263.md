---
title: LeetCode#263 Ugly Number - in Swift
date: 2017-10-09 14:17:54
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
Write a program to check whether a given number is an ugly number.
 
Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. For example, 6, 8 are ugly while 14 is not ugly since it includes another prime factor 7.

Note that 1 is typically treated as an ugly number.

驗證給的數字是否為醜數 。

醜數為一正整數，其質因數只包含 2, 3, 5 。

例如 6 和 8 就是醜數， 14 不是因為他的質因數包含 7 。

1 是特例的醜數。

# 解題

因為質因數包含 2, 3, 5 ，那只要確認給的數字能否被這三個數字整除到 1 即可。

``` swift
func isUgly(_ num: Int) -> Bool {
    if num == 0 { return false }
    var num = num
    for i in 2...5 where i != 4 {
        while num % i == 0 {
            num /= i
        }
    }
    return num == 1
}
```