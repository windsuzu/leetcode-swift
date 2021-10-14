---
title: LeetCode#448 Find All Numbers Disappeared in an Array - in Swift
date: 2017-08-09 13:10:52
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
Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
Find all the elements of [1, n] inclusive that do not appear in this array.
Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

給一個整數陣列，範圍介在 1 ≤ a[i] ≤ n ( n 代表陣列長度)，注意有的元素可能出現兩次有一只有一次。
尋找陣列中有哪幾個數字不見了。 請在 O(n) 時間內算出。



Example:
``` swift
Input:
[4,3,2,7,8,2,3,1]

Output:
[5,6]
```

[4,3,2,7,8,2,3,1] 有 8 個元素，應該要包含 [1,2,3,4,5,6,7,8] 。
可是缺少了 [5,6] 。


# 第一次解題 : Wrong Answer
第一次理解錯題目了，以為是 n 是指陣列中最大的那個數字，
雖然 [4,3,2,7,8,2,3,1] 可行， 但 [1,1] 就錯了。


``` swift
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    guard let max = nums.max() else {
        return []
    }
    var result = [Int]()
    for i in 1...max {
        if !nums.contains(i) {
            result.append(i)
        }
    }
    return result
}
```


# 第二次解題 : Time Limit Exceeded
用 contains 函數可能太耗時間了，所以沒過。

``` swift
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    if nums.isEmpty { return [] }
    var result = [Int]()
    for i in 1...nums.count {
        if !nums.contains(i) {
            result.append(i)
        }
    }
    return result
}
```


# 第三次解題 : 169 ms
對每一個數字應該在的位子標記成 `負數` ， 以 [4,3,2,7,8,2,3,1] 為例 :
 
* 第一個迴圈的意思 :
4 應該在陣列中第三個位子， 所以 nums[abs(nums[0]) -1] = nums[3]
把 nums[3] 標註成負數 nums[val] = -nums[val]
如果該數字已經標註成負數，就跳過。


* 第二個迴圈的意思 :
現在你已經有了新的陣列 -> [-4,-3,-2,-7,8,2,-3,-1]
就可以知道 [8,2] 的位子沒有變成負數，也就是陣列中第五個跟第六個是缺少的。

``` swift
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var nums = nums
    var result = [Int]()
    
    for i in 0..<nums.count {
        let val = abs(nums[i]) - 1
        if nums[val] > 0 {
            nums[val] = -nums[val]
        }
    }
    
    for i in 0..<nums.count {
        if nums[i] > 0 {
            result.append(i + 1)
        }
    }
    return result
}
```






