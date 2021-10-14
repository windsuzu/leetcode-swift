---
title: LeetCode#231 Power of Two - in Swift
date: 2017-10-02 22:39:55
tags:
- LeetCode
- Swift
- Math
- Bit Manipulation
categories:
- LeetCode
- Swift
- Math
- Bit Manipulation
---

# 題目
Given an integer, write a function to determine if it is a power of two.
 
給個整數，寫個函式驗證他是否為 2 的平方數。

---

# 解題

## 迭代

只要可以被 2 整除，就對該數除 2 ，直到無法再除。

查看該數是否為 1 。

``` swift
func isPowerOfTwo(_ n: Int) -> Bool {
    if n <= 0 { return false }
    var n = n
    while n % 2 == 0 { n /= 2 }
    return n == 1
}
```

---

## 位元操作

2 的位元數就代表該數「二進位」只有一個 1 。

所以只要將 n 與 n - 1 做 AND 運算看是否為 0 即可。

``` swift
1(1), 2(10), 4(100), 8(1000), 16(10000) ....

1 & 0 = 0
10 & 01 = 0
100 & 011 = 0
1000 & 0111 = 0
..
..

```

``` swift
func isPowerOfTwo(_ n: Int) -> Bool {
    if n <= 0 { return false }
    return n & (n - 1) == 0
}
```