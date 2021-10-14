---
title: LeetCode#1 Two Sum - in Swift
date: 2017-07-22 09:18:56
tags:
- LeetCode
- Swift
categories: 
- LeetCode
- Swift
---

為了增進自己的基礎，從今天開始每天使用Swift解一題LeetCode。加油！

# 題目
Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
You may assume that each input would have exactly one solution, and you may not use the same element twice.

丟進一個整數陣列和一個目標值， 並且回傳一個整數陣列， 其中包含兩個數， 這兩個數的總和應該等於目標值
 
必須保證每一次輸入的數字都能夠有一個正確的答案， 並且不會重複使用同一個(元素 (第一次看成數字 X_X))

Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1]




# 第一次提交 : Time Limit Exceeded
透過建立一個 Dictionary ，將陣列中每一個數配對一個 key ，
對 Dictionary 採用 key 由小到大迴圈 ， 並且再迴圈一次配對不同的 element (key != key2)，
只要兩者的值相同即為答案。

可惜第一次玩 Leetcode 發現居然有效率限制，這樣子的做法雖然可以解答，但是效率太差⋯⋯

``` swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    var dict = [Int: Int]()
    for (index, element) in nums.enumerated() {
        dict[index] = element
    }

    for (key, value) in dict.sorted(by: <) {
        for (key2, value2) in dict where key != key2 {

            if value + value2 == target {
                return [key, key2]
            }
        }
    }
    return [0]
}
```



# 第二次提交 : Time Limit Exceeded
第二次直接用暴力破解法，一樣雖然可以成功，
但是看來不是少個字典就可以呢... 花了 O(n^2) 的時間
又因為效率太差被拒絕了⋯⋯

``` swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    for i in stride(from: 0, to: nums.count, by: 1) {
        for j in stride(from: i+1, to: nums.count, by: 1) {
            if nums[j] == target - nums[i] {
                return [i,j]
            }
        }
    }
    return [0]
}
```




# 第三次提交 : Time Limit Exceeded
一樣將數值跟第一次實作一樣存入 dictionary 中，
迴圈時，
算出目標值與目前數值的差 (complement)
直接去查看 dictionary 中有沒有符合 complement 的數字
有就是答案！ 回傳[答案的index, 跟現在數字的index]

其實第三次已經使用了 O(n) 的時間，但不知道為何還是效率太差 ?_?

``` swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    var dict = [Int: Int]()
    for (index, element) in nums.enumerated()  {

        let complement = target - element

        if dict.values.contains(complement) {
            return [nums.index(of: complement)!, index]
        }

        dict[index] = element
    }

    return [0]
}

```


# 第四次提交 : Accepted
第四次手癢參考了一下[別人的做法](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Two-Sum%20Problem)

`for i in 0..<nums.count` 就可以用最快的速度得到迴圈跟 index
先看 else 的部分:
dict[算出目標值與目前數值的差] = 值的 index

之後的迴圈:
只要目前數值在 dict 當中出現，馬上知道是答案想要的差值
直接回傳 [差值, 現在的index]


``` swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dict = [Int: Int]()
    
    for i in 0..<nums.count {
        if let target = dict[nums[i]] {
            return [target, i]
        } else {
            dict[target - nums[i]] = i
        }
    }
    
    return [0]
}
```