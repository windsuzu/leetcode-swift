---
title: LeetCode#171 Excel Sheet Column Number - in Swift
date: 2017-08-24 21:18:04
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
Given a column title as appear in an Excel sheet, return its corresponding column number.
 
將 EXCEL 英文欄位轉為對應數字欄位。

For example:

``` swift
A -> 1
B -> 2
C -> 3
...
Z -> 26
AA -> 27
AB -> 28
```


# 解題

將每個字元轉換為 ASCII 碼，並且減掉 64 使 A~Z 變為 1~26 。

在加入下一字元前，須考慮每一次進位就要乘上前一個字元經過幾次 26 次。

![](leetcode-171/sheet.gif)


``` swift
func titleToNumber(_ s: String) -> Int {
    var res = 0
    for i in s.utf8 {
        res = res * 26 + (Int(i) - 64)
    }
    return res
}
```


