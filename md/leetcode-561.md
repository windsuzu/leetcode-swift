---
title: LeetCode#561 Array Partition I - in Swift
date: 2017-07-26 13:26:20
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

Given an array of 2n integers, your task is to group these integers into n pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
 
給一個「2n數量」的整數陣列，目標是把這些整數分成「n組」配對的整數，並且找出每組的最小值的最大值。
 
 
Example 1:
`Input: [1,4,3,2]`
 
Output: 4
`Explanation: n is 2, and the maximum sum of pairs is 4 = min(1, 2) + min(3, 4).`

範例中 n 為 2 ，所有配對的最大加總就是 4


Note:
 n is a positive integer, which is in the range of [1, 10000].
 All the integers in the array will be in the range of [-10000, 10000].
 
 n 必須為正整數，範圍是 1 至 10000
 陣列中所有數字必須介於 -10000 至 10000



# 理解
其實他題目講解得有點爛，花了一些時間終於知道他想要幹嘛，難怪大家給題目評分 GOOD 75 , BAD 209 。

意思是說 : 如果給的陣列是 `[1,4,3,2]` 好了
我必須去找出 2個2個 配對， 並且從每一個配對的最小值，全部加總起來找到最大值。

如果分成 [1,4], [3,2] -> 1 + 2 = 3
分成 [1,3], [4,2] -> 1 + 2 = 3
分成 [1,2], [4,3] -> 1 + 3 = 4

所以最大值就是 4




# 第一次解題 : Accepted

可以發現任何的2n陣列如 `[1,5,3,7,9,8,33,20]`
想要找到「每組最小值」總和最大值的話
剛好就是「每兩個最小」的值取最小的值
 
以`[1,5,3,7,9,8,33,20]`來說 就是 (1,3), (5,7), (8,9), (20,33) -> 1 + 5 + 8 + 20 = 34
所以只需要將陣列由小到大排序
並且跳過偶數位置的數字，相加起來就是答案


``` swift
func arrayPairSum(_ nums: [Int]) -> Int {
    
    var sum = 0
    
    let sortNums = nums.sorted(by: <)
    
    for i in 0..<sortNums.count where i % 2 == 0 {
        sum += sortNums[i]
    }
    
    return sum
}
```





