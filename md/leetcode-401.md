---
title: LeetCode#401 Binary Watch - in Swift
date: 2017-09-12 14:07:15
tags:
- LeetCode
- Swift
- Backtracking
- Bit Manipulation
categories:
- LeetCode
- Swift
- Backtracking
- Bit Manipulation
---

# 題目
A binary watch has 4 LEDs on the top which represent the hours (0-11), and the 6 LEDs on the bottom represent the minutes (0-59).
 
Each LED represents a zero or one, with the least significant bit on the right.

一個二元錶有四個 LEDs 在上，代表 24 個小時，還有六個 LEDs 在下，代表 60 分鐘。

![binary watch](https://upload.wikimedia.org/wikipedia/commons/8/8b/Binary_clock_samui_moon.jpg)
For example, the above binary watch reads "3:25".

Given a non-negative integer n which represents the number of LEDs that are currently on, return all possible times the watch could represent.

像上面就是一個二元錶，代表 3:25 。

設計一個函式，放進 n 表示有幾顆 LED 燈亮著，回傳所有有可能的時間。

---

# 範例

``` swift
Input: n = 1
Return: ["1:00", "2:00", "4:00", "8:00", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32"]
```

> 注意
小時的格式，不可有前綴的 0 ，舉例 : "1:00" 是對的 , "01:00" 是錯的。
分鐘的格式，必須有前綴的 0 ，舉例 : "10:01" 是對的 , "10:1" 是錯的。

---

# 解題

可不可以找出每一個時間，個別代表有幾個燈號，答案是可以的。
如果是 `0:00` 代表有 0 顆燈亮著。
`1:00` 、 `0:04` 、 `0:16` ，代表有 1 顆燈亮著。
`11:59` 代表有 8 顆燈 (3 + 5) 亮著。 為什麼？

只要看二進位就知道 1 -> 1 ， 2 -> 10 ， 4 -> 100 ， 8 -> 1000 ， 16 -> 10000 ， 32 -> 100000

所以如果把 11 跟 59 都轉成二進位會變成 01011 跟 0111011 。
就可以知道，
11 亮了 1, 2, 8 的燈。
59 亮了 1, 2, 8, 16, 32 的燈。

知道了這個，現在只要找出全部的時間，符合燈號跟設定要找的一致，就可以放進答案中。

![](leetcode-401/binary_watch.gif)

``` swift
import Foundation

func readBinaryWatch(_ num: Int) -> [String] {
    var res = [String]()
    
    func findLEDs(_ h: Int, _ m: Int) -> Int {
        let hc = Array(String(h, radix: 2).characters).filter { $0 == "1" }.count
        let mc = Array(String(m, radix: 2).characters).filter { $0 == "1" }.count
        return hc + mc
    }
    
    for h in 0...11 {
        for m in 0...59 {
            if findLEDs(h, m) == num {
                res.append(String(format: "%d:%02d", h, m))
            }
        }
    }
    
    return res
}
```








