---
title: LeetCode#409 Longest Palindrome - in Swift
date: 2017-09-09 11:28:51
tags:
- LeetCode
- Swift
- Hash Table
categories:
- LeetCode
- Swift
- Hash Table
---

# 題目

Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.
 
This is case sensitive, for example "Aa" is not considered a palindrome here.

給一個字串包含大小寫文字，找出裡面文字能拼成最長的回文有多長。

請注意大小寫的區別， "Aa" 不包含在回文裡面。

Example:

``` swift
Input:
"abccccdd"

Output:
7

Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.
```

"abccccdd" 最長的回文可以拼成 "dccaccd"，長度為 7 。

---

# 解題

可以發現不管文字有多少，只要相同的字出現兩次，回文最長長度就會 + 2 。

如果分完所有的兩次，還有剩下任意一個單字，就可以把它加進回文中，最長長度 + 1 。

``` swift
"aa" -> 2
"aab" -> 3

"aabb" -> 4
"aabbc" -> 5
"aabbcd" -> 5
```

![](leetcode-409/palindromes.gif)


``` swift
func longestPalindrome(_ s: String) -> Int {
    var dict = [Character : Int]()
    var res = 0
    
    for c in s.characters {
        if var i = dict[c] {
            i += 1
            if i == 2 {
                res += 2
                i = 0
            }
            dict[c] = i
        } else {
            dict[c] = 1
        }
    }
    
    if dict.contains(where: {$0.1 > 0 }) {
        res += 1
    }
    
    return res
}
```










