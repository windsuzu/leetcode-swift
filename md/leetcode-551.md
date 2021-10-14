---
title: LeetCode#551 Student Attendance Record I - in Swift
date: 2017-09-17 12:17:44
tags:
- LeetCode
- Swift
- String
categories:
- LeetCode
- Swift
- String
---

# 題目

You are given a string representing an attendance record for a student. The record only contains the following three characters:
 
'A' : Absent.
'L' : Late.
'P' : Present.


給定一字串代表某位學生的出席紀錄。 字串中只會包含三種字元:
'A' : 缺席
'L' : 遲到
'P' : 出席


A student could be rewarded if his attendance record doesn't contain more than one 'A' (absent) or more than two continuous 'L' (late).


只要學生沒有超過一個「 A (缺席) 」，或是沒有「連續」超過兩個「 L (遲到) 」，就可以得到獎勵。


You need to return whether the student could be rewarded according to his attendance record.

請設計函式，回傳學生是否有因為出席紀錄而獲得獎勵。

---

# 範例

Example 1:
``` swift
Input: "PPALLP"
Output: True
```
A 沒有超過 1 個， L 也沒有超過 2 個，所以是可以獲得獎勵的。

Example 2:
``` swift
Input: "PPALLL"
Output: False
```
A 沒有超過 1 個，但 L 超過連續 2 個了，所以不可以獲得獎勵。

---

# 解題

找出字串中，A 出現次數有沒有大於 1 次，以及有沒有連續出現三個 L ，就可以得知是否獲得獎勵。

![](leetcode-551/attendance.gif)

``` swift
import Foundation

func checkRecord(_ s: String) -> Bool {
    var res = false
    let countA = Array(s.characters).filter { $0 == "A" }.count
    if !s.contains("LLL") && countA <= 1 {
        res = true
    }
    return res
}
```

