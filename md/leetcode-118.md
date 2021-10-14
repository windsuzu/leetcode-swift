---
title: LeetCode#118 Pascal's Triangle - in Swift
date: 2017-10-14 14:46:39
tags:
- LeetCode
- Swift
- Array
categories:
- LeetCode
- Swift
- Array
---

# 題目
Given numRows, generate the first numRows of Pascal's triangle.

給定行數 N ，返回 N 行的[帕斯卡三角形](https://zh.wikipedia.org/wiki/%E6%9D%A8%E8%BE%89%E4%B8%89%E8%A7%92%E5%BD%A2)。

---

# 範例

``` swift
For example, given numRows = 5,
Return

[
       [1],
      [1,1],
     [1,2,1],
    [1,3,3,1],
   [1,4,6,4,1]
]
```

# 解題

從 wikipedia 發現 Pascal's Triangle 有一個特性，從第二層之後，

除了首尾皆為 1 以外，其他每一格的值皆由上方兩個值加總所得。

![](leetcode-118/PascalTriangleAnimated2.gif)

所以透過這個特性，來填滿每一層除了首尾以外的中間值即可。

``` swift
func generate(_ numRows: Int) -> [[Int]] {
    var res = [[Int]]()
    if numRows == 0 { return res }
    res.append([1])
    if numRows == 1 { return res }
    res.append([1, 1])
    if numRows == 2 { return res }
    
    for i in 2..<numRows {
        var temp = [Int]()
        temp.append(1)
        
        let lastRow = res[i - 1]
        for i in 0..<lastRow.count {

            if i == lastRow.count - 1 {
                temp.append(1)
            } else {
                temp.append(lastRow[i] + lastRow[i + 1])
            }
        }
        res.append(temp)
    }
    return res
}
```