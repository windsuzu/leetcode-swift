---
title: LeetCode#242 Valid Anagram
date: 2017-09-05 14:36:41
tags:
- LeetCode
- Swift
- Sort
- Hash Table
categories:
- LeetCode
- Swift
- Sort
- Hash Table
---

# 題目
Given two strings s and t, write a function to determine if t is an anagram of s.
 
有兩個字串 s 跟 t ，寫個函式來驗證 t 是否為 s 重新建構出來的字串。


For example :
``` swift
s = "anagram", t = "nagaram", return true.
s = "rat", t = "car", return false.
```

"nagaram" 是從 anagram 重構出來的所以回傳 true 。
"rat" 不是從 car 重構的所以回傳 false 。


# 解題

建立一個字元表，第一次將 s 每個字元放進去字元表中。

第二次尋遍 t ，將相同出現的字元從字元表減去。

最後若字元表有不為 0 的數字，則代表 t 跟 s 沒有相符。

![](leetcode-242/anagram.gif)

``` swift
func isAnagram(_ s: String, _ t: String) -> Bool {
    var alphabet = [Int](repeating: 0, count: 26)
    for c in s.utf8 { alphabet[Int(c) - 97] += 1 }
    for c in t.utf8 { alphabet[Int(c) - 97] -= 1 }
    for i in alphabet { if i != 0 { return false } }
    return true
}
```