---
title: LeetCode#387 First Unique Character in a String - in Swift
date: 2017-09-02 14:07:49
tags:
- LeetCode
- Swift
categories:
- LeetCode
- Swift
---


# 題目

Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
從字串中找出第一個沒有重複的字元，並返回她的索引。如果沒有，則返回 -1 。

Examples:

``` swift
s = "leetcode"
return 0.

s = "loveleetcode",
return 2.
```

「leetcode」的第一個字元 l 沒有重複出現在字串中，所以回傳 0 。

「loveleetcode」的第三個字元 v 沒有重複，所以回傳 2 。

Note: You may assume the string contain only lowercase letters.

可以假設字串中只有小寫的單字。

---

# 解題

無腦的用 dictionary 做了一次果然被算 timeout 。

AC 解是將各個字元轉為字母 0 ~ 25 ，代表陣列中 26 個位置，
只要該單字出現，便 + 1 至該位置中。

第二次迴圈時，只要出現第一個位置為 1 (只出現過一次) 的字母，便回傳該索引。

![](leetcode-387/uniquec.gif)

``` swift
func firstUniqChar(_ s: String) -> Int {
    var alphabet = [Int?](repeating: nil, count: 26)
    
    for c in s.utf8 {
        let index = Int(c - 97)
        if var val = alphabet[index] {
            val += 1
            alphabet[index] = val
        } else {
            alphabet[index] = 1
        }
    }
    
    var index = 0
    for c in s.utf8 {
        if alphabet[Int(c - 97)] == 1 {
            return index
        }
        index += 1
    }
    return -1
}
```

