---
title: LeetCode#70 Climbing Stairs - in Swift
date: 2017-10-03 14:13:24
tags:
- LeetCode
- Swift
- Dynamic Programming
categories:
- LeetCode
- Swift
- Dynamic Programming
---

# 題目
You are climbing a stair case. It takes n steps to reach to the top.
 
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

你正在爬樓梯，需要花 n 步可以走到頂端。

每一步你可以踩 1 或 2 格樓梯。

請問你有幾種方法可以走到頂端 ?

---

# 解題

如果有 1 層，有 1 一種方式 (只有踩 1 格)

如果有 2 層，有 11, 2 兩種方式 (連續踩兩次 1 格或一次踩 2 格)

如果有 3 層，有 111, 12, 21 三種方式

如果有 4 層，有 1111, 112, 121, 211, 22 五種方式

如果有 5 層，有 11111, 1112, 1121, 1211, 2111, 122, 212, 221 八種方式

---

注意看， 
n = 1, 1
n = 2, 2
n = 3, 3 = 1 + 2 (前面兩個結果相加)
n = 4, 5 = 3 + 2 (前面兩個結果相加)
n = 5, 8 = 5 + 3 (前面兩個結果相加)

這題其實要解的是[費氏數列](https://zh.wikipedia.org/wiki/%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97)

``` swift
func climbStairs(_ n: Int) -> Int {
    if n <= 0 { return 0 }
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    
    var res = 0
    var n1 = 1
    var n2 = 2
    
    for _ in 2..<n {
        res = n1 + n2
        n1 = n2
        n2 = res
    }
    return res
}
```