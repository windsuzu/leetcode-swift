---
title: LeetCode#136 Single Number - in Swift
date: 2017-08-05 19:51:00
tags:
- LeetCode
- Swift
- Hash Table
- Bit Manipulation
categories: 
- LeetCode
- Swift
- Hash Table
- Bit Manipulation
---


# 題目

Given an array of integers, every element appears twice except for one. Find that single one.
 
給一串整數陣列，每個元素皆會出現兩次，只有一個元素不會。找出那一個元素。
 

Example:
 Input: [1,1,2,3,3,6,6]
 Output: 2

1, 3, 6 皆有重複出現，唯有 2 只出現一次。


Note:
Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
你的演算法必須設定在 O(n) 時間內完成


# 第一次解題 : Time Limit Exceeded

手癢用 for + filter 的組合去找出 count 小於 2 次的數字。
但想想給了 Time Limit Exceeded 也是摸雞籠的事。

``` swift
func singleNumber(_ nums: [Int]) -> Int {
    for num in nums {
        if (nums.filter { $0 == num }).count < 2 {
            return num
        }
    }
    return -1
}
```


# 第二次解題 : 25 ms

偷看到可以用 XOR 解題
因為已經知道相同數字經過 XOR 運算後會等於 0 ，
並且 XOR 運算是符合`交換律`的。
 
XOR 交換律 :
 101 ^ 101 ^ 010 =
 000 ^ 010 =
 010
 
 101 ^ 010 ^ 101 =
 111 ^ 101 =
 010
 
也就是 1 ^ 1 = 0  -> 
1 ^ 1 ^ 2 = 2
就算順序不同也會出現相同答案 : 1 ^ 2 ^ 1 = 2

``` swift
func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
        result ^= num
    }
    return result
}
```























