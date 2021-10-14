---
title: LeetCode#371 Sum of Two Integers - in Swift
date: 2017-08-11 14:36:33
tags:
- LeetCode
- Swift
- Bit Manipulation
categories: 
- LeetCode
- Swift
- Bit Manipulation
---

# 題目

Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.
 
實現加法但不使用 + 或 - 。

Example:
Given a = 1 and b = 2, return 3.


# 第一次解題
加法可以用 XOR (^) 來取得， 而進位可以透過 AND (&) 取得。
 
如果 a 和 b 的二進制沒有 bits 在相同位置那就可以透過 ^ 直接取得相加值。
例如 1(0001) ^ 4(0100) =  5(0101)
例如 8(1000) ^ 7(0111) =  15(1111)


那如果要對有相同位置的兩個 a 和 b 操作加法，就必須要用到 & 。
& 能夠給我們 a 和 b 所有的進位 bits 。

例如 5(0101) & 9(1001) = 1(0001)
例如 1(0001) & 5(0101) = 1(0001)


所以我們先算出 (a & b) << 1 並且將它加進 a ^ b 中。

以 12 + 14 為例 :
``` swift
12 (01100) & 14 (01110) << 1 = 12 (01100) << 1 = 24 (11000)
12 (01100) ^ 14 (01110) = 2 (00010)
2 (00010) ^ 24 (11000) = 26 (11010)
```

以 60 + 40 為例 :
``` swift
(60 & 40) << 1 = 80  // (0111100 & 0101000) << 1 = 0101000 << 1 = 1010000
60 ^ 40 = 20 // 0111100 ^ 0101000 = 0010100


(20 & 80) << 1 = 32 // (0010100 & 1010000) << 1 = 0010000 << 1 = 0100000
20 ^ 80 = 68 // 0010100 ^ 1010000 = 1000100


(68 & 32) << 1 = 0 // (1000100 & 0100000) << 1 = 0000000 << 1 = 0000000
68 ^ 32 = 100 // 1000100 ^ 0100000 = 1100100
```


``` swift
func getSum(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let carry = a & b
        a ^= b
        b = carry << 1
    }
    return a
}
```


# Recursive Solution
``` swift
func getSum(_ a: Int, _ b: Int) -> Int {
    let result = a ^ b
    let carry = (a & b) << 1
    if carry != 0 {
        return getSum(result, carry)
    }
    return result
}
```



# One Line Solution
``` swift
func getSum(_ a: Int, _ b: Int) -> Int {
    return b==0 ? a : getSum(a ^ b, (a & b) << 1)
}
```

我到底.. 在寫啥小..







