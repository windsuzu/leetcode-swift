---
title: LeetCode#521 Longest Uncommon Subsequence I - in Swift
date: 2017-08-05 15:34:33
tags:
- LeetCode
- Swift
- String
categories: 
- LeetCode
- Swift
- String
---

# 注意
這應該是個愚人節題目。


# 題目
Given a group of two strings, you need to find the longest uncommon subsequence of this group of two strings. The longest uncommon subsequence is defined as the longest subsequence of one of these strings and this subsequence should not be any subsequence of the other strings.
 
A subsequence is a sequence that can be derived from one sequence by deleting some characters without changing the order of the remaining elements. Trivially, any string is a subsequence of itself and an empty string is a subsequence of any string.
 
The input will be two strings, and the output needs to be the length of the longest uncommon subsequence. If the longest uncommon subsequence doesn't exist, return -1.


給兩個字串，你必須在兩個字串中找出 longest uncommon subsequence (最長的不同字元序列 ? 考我英文 ?)， 這個序列代表的是一個「全新、不同於另一個字串所擁有的字元序列」。
 
一個字元序列可以從其他的字串衍生而來，舉一般例子，任何字串都可以是自己的字元序列，而空白也可以是任何字串的字元序列。
 
輸入兩個字串，輸出一個最長的不同字元序列，如果不存在最長的不同字元序列，那就輸出 -1 。


Example 1:
``` swift
Input: "aba", "cdc"
Output: 3

Explanation: The longest uncommon subsequence is "aba" (or "cdc"),
because "aba" is a subsequence of "aba",
but not a subsequence of any other strings in the group of two strings.
```

在這個範例中，最長的不同字元序列可以是 "aba" 或是 "cdc"
因為 "aba" 是 "aba" 的字元序列
但不是任何其他字串的字元序列


# 第一次解題 : 15 ms
這純粹是一題考我英文的題目
<img src="./leetcode-521/question.jpg" width="200">
因為只有兩個字串相同時，會發生不存在不同字元序列。
其他時間只要列出最長的那個字串的長度就行了。


``` swift
func findLUSlength(_ a: String, _ b: String) -> Int {
    return a == b ? -1 : max(a.characters.count, b.characters.count)
}
```









