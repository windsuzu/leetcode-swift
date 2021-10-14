---
title: LeetCode#455 Assign Cookies - in Swift
date: 2017-08-26 13:12:21
tags:
- LeetCode
- Swift
- Greedy
categories:
- LeetCode
- Swift
- Greedy
---

# 題目
Assume you are an awesome parent and want to give your children some cookies.
 
But, you should give each child at most one cookie. Each child i has a greed factor gi, which is the minimum size of a cookie that the child will be content with;

and each cookie j has a size sj. If sj >= gi, we can assign the cookie j to the child i, and the child i will be content.

Your goal is to maximize the number of your content children and output the maximum number.

給定兩個陣列，一個代表各個餅乾的尺寸， 一個代表每個小孩想要的餅乾尺寸。

現在將餅乾分配給小孩們，但分配的餅乾尺寸不能夠小於小孩期望的餅乾尺寸。

求這些餅乾最多可以滿足幾個小孩。

Example 1:
``` swift
Input: [1,2,3], [1,1]

Output: 1

Explanation: You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3.
And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
You need to output 1.
```
現在有三個小孩，兩個尺寸為 1 的餅乾，但只有一個小孩接受尺寸為 1 的餅乾，所以得出答案 1 。
 

Example 2:
``` swift
Input: [1,2], [1,2,3]

Output: 2

Explanation: You have 2 children and 3 cookies. The greed factors of 2 children are 1, 2.
You have 3 cookies and their sizes are big enough to gratify all of the children,
You need to output 2.
```
現在有兩個小孩，三個尺寸為 1, 2, 3 的餅乾，一個小孩接受尺寸為 1 的餅乾， 另一個接受尺寸為 2 的餅乾，所以得出答案 2 。
 


# 解題

將小孩按照慾望的順序由低往高排，餅乾也照著尺寸大小由小往大排。

遍尋餅乾的尺寸，只要小孩喜歡這個餅乾，就將已滿足的小孩 + 1 。

由於慾望與餅乾皆有排序，所以餅乾才可以不斷地往前數，因為前一個小孩不想要的，下一個小孩當然也不想要。

![](leetcode-455/greedy.gif)

``` swift
func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    let g = g.sorted(by: <)
    let s = s.sorted(by: <)
    var i = 0
    var j = 0
    
    while(i<g.count && j<s.count) {
        if g[i] <= s[j] {
            i += 1
        }
        j += 1
    }
    return i
}
```














