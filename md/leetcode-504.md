---
title: LeetCode#504 Base 7 - in Swift
date: 2017-09-14 11:27:25
tags:
- LeetCode
- Swift
categories:
- LeetCode
- Swift
---

# 題目
Given an integer, return its base 7 string representation.

將數字從 10 進位轉為 7 進位。

---

# 範例
Example 1:

``` swift
Input: 100
Output: "202"
```
100 在七進位為 202

Example 2:

``` swift
Input: -7
Output: "-10"
```
-7 在七進位為 -10

---

# 解題

利用 swift 內建的基數函式。

``` swift
func convertToBase7(_ num: Int) -> String {
    return String(num, radix: 7)
}
```