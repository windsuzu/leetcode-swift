---
title: LeetCode#66 Plus One - in Swift
date: 2017-10-15 14:15:32
tags:
- LeetCode
- Swift
- Array
- Math
categories:
- LeetCode
- Swift
- Array
- Math
---

# 題目
Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
You may assume the integer do not contain any leading zero, except the number 0 itself.

The digits are stored such that the most significant digit is at the head of the list.

利用陣列來表示一個非負數整數，不可包含前綴的 0 ，現在對這個整數加一。

---

# 範例

7 = [7] , 7 + 1 = 8 = [8]

19 = [1,9] , 19 + 1 = 20 = [2,0]。

999 = [9,9,9] , 999 + 1 = 1000 = [1,0,0,0]

---

# 解題

先對陣列的最後一個值 + 1 。

若是陣列中含有 10 ，代表需要進位。將該值變為零，前一個值 + 1 。

若遇到 [9,9] 這類的，必須要新增一個新陣列放 1 在最前方，使之變為 [1,0,0] 。 

``` swift
func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        digits[digits.count - 1] += 1

        while digits.contains(10) {
            let i = digits.index(of: 10)!
            digits[i] = 0
            if i - 1 >= 0 {
                digits[i - 1] += 1
            } else {
                var new = [1]
                new.append(contentsOf: digits)
                digits = new
            }
        }
        return digits
    }
```