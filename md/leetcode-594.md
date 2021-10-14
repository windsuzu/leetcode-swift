---
title: LeetCode#594 Longest Harmonious Subsequence - in Swift
date: 2017-09-26 20:39:09
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
We define a harmonious array is an array where the difference between its maximum value and its minimum value is exactly 1.

Now, given an integer array, you need to find the length of its longest harmonious subsequence among all its possible subsequences.

我們定義一個和諧陣列，該陣列的最大值及最小值只相差 1 。

現在給你一個普通陣列，從該陣列的子序列去找出該陣列中最長的和諧陣列。

> Note: The length of the input array will not exceed 20,000.
輸入的陣列長度不超過 20000 。

---

# 範例

Example 1:
``` swift
Input: [1,3,2,2,5,2,3,7]

Output: 5

Explanation: The longest harmonious subsequence is [3,2,2,2,3].
```

從 Input 的陣列中，有一個子序列符合和諧陣列，就是 [3,2,2,2,3]

---

# 解題

先將每個數字的 count 用 dictionary 記錄下來。
[1,3,2,2,5,2,3,7] -> [1: 1, 2: 3, 3: 2, 5: 1, 7: 1]


接著再跑一次 dictionary ，只要有 count 可以被 key + 1 撈出，
就將 count 跟 secondCount 加在一起。


``` swift
func findLHS(_ nums: [Int]) -> Int {
    var dict = [Int:Int]()
    for num in nums {
        dict[num] = (dict[num] != nil) ? dict[num]! + 1 : 1
    }
    
    var res = 0
    for (key, count) in dict {
        if let secondCount = dict[key + 1] {
            let temp = count + secondCount
            
            if temp > res {
                res = temp
            }
        }
    }
    return res
}
```
