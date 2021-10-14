---
title: LeetCode#383 Ransom Note - in Swift
date: 2017-08-24 13:03:34
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
Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
 
Each letter in the magazine string can only be used once in your ransom note.

給予 A 字串與 B 字串， 若 A 字串的每一個字皆由 B 字串取得而來，回傳 true 。
每個字元從 B 只能取得一次，每個字元皆是獨一無二的。


Note: 
``` swift
You may assume that both strings contain only lowercase letters.

canConstruct("a", "b") -> false
canConstruct("aa", "ab") -> false
canConstruct("aa", "aab") -> true
```

可以從 B 字串（aab） 可以拿到 （aa） 組成 A 字串，所以回傳 true 。


# 解題

重新定義兩個可以變動的字串，尋遍原本的 a ，若 b 包含該字元，就把 a 和 b 該字元刪除。
最後若是 a 被刪除到空字串，證明 a 的字元皆由 b 組成。

![](leetcode-383/note.gif)

``` swift
import Foundation

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var a = ransomNote
    var b = magazine
    
    for c in ransomNote.characters {
        if b.contains("\(c)") {
            b.remove(at: (b.range(of: "\(c)")?.lowerBound)!)
            a.remove(at: (a.range(of: "\(c)")?.lowerBound)!)
        }
    }
    
    return a == "" ? true : false
}
```

