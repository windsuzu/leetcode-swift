---
title: LeetCode#268 Missing Number - in Swift
date: 2017-09-15 13:39:07
tags:
- LeetCode
- Swift
- Array
- Math
- Bit Manipulation
categories:
- LeetCode
- Swift
- Array
- Math
- Bit Manipulation
---

# 題目
Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

給定 n 個不同的數字，從 0, 1, 2, ... , n ， 找出其中消失的數字。
 
---
 
# 範例
Given nums = [0, 1, 3] return 2.

[0, 1, 3] 當中發現 2 消失了。

---

# 解題
## SUM 解法

如果把原來的陣列相加，跟完整的陣列相加。完整減掉題目原來的就應該得到消失的數字。
題目 : 0 + 1 + 3 = 4
完整 : 0 + 1 + 2 + 3 = 6

迴圈內應該長成這樣 ：
0 + 0 - 0 + 1 - 1 + 2 - 3 = -1

因為加不到最後的數字，所以應該在最後加上 (-1) + 3 = 2

``` swift
func missingNumber(_ nums: [Int]) -> Int {
    var sum = 0
    for i in 0..<nums.count {
        sum += i
        sum -= nums[i]
    }
    return sum + nums.count
}
```


## XOR 解法

我們都知道 a^b^b 會等於 a

所以如果陣列為 0 , 1 , 3 
跑過迴圈會變成 :
<font style="color: red">3</font> ^ <font style="color: blue">0</font> ^ <font style="color: blue">0</font> ^ <font style="color: green">1</font> ^ <font style="color: green">1</font> ^ 2 ^ <font style="color: red">3</font> = 2

就可以輕鬆地知道 2 是消失的數字。

``` swift
func missingNumber(_ nums: [Int]) -> Int {
    var res = nums.count
    for i in 0..<nums.count {
        res ^= i
        res ^= nums[i]
    }
    return res
}
```