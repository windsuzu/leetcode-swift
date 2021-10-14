---
title: LeetCode#326 Power of Three - in Swift
date: 2017-09-29 13:18:37
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
Given an integer, write a function to determine if it is a power of three.
 
給予一個整數，找出他是否為 3 的某次方。

Follow up:
Could you do it without using any loop / recursion?

能否不用任何迴圈 / 遞迴 ?

---

# 解題

## Iterative Solution
作為 3 的次方數，不斷除以 3 就會變成 1 ，但必須要注意數字要保持 % 3 == 0 。

27 -> 27/3 -> 9/3 -> 3/3 -> 1 (O)

18 -> 18/3 -> 6/3 -> 2 (X)

15 -> 15/3 -> 5 (%3 != 0) (X)

``` swift
func isPowerOfThree(_ n: Int) -> Bool {
    var x = n
    if x > 1 {
        while x % 3 == 0 {
            x /= 3
        }
    }
    return x == 1
}
```


## Recursive Solution

把迴圈換成遞迴。

``` swift
func isPowerOfThree(_ n: Int) -> Bool {
    return n > 0 && (n == 1 || (n % 3 == 0 && isPowerOfThree(n / 3)))
```


## No Loop / Recursion Solution

3^19 為 1,162,261,467 , 再過來 3^20 = 3,486,784,401 已經超出 Int 的最大範圍 (2,147,483,647)。

所以只要 n > 0 且能被 3^19 整除就是 3 的次方數。

``` swift
func isPowerOfThree(_ n: Int) -> Bool {
    return ( n > 0 && 1162261467 % n == 0)
}
```

