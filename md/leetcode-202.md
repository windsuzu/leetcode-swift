---
title: LeetCode#202 Happy Number - in Swift
date: 2017-09-24 15:14:56
tags:
- LeetCode
- Swift
- Hash Table
- Math
categories:
- LeetCode
- Swift
- Hash Table
- Math
---

# 題目
Write an algorithm to determine if a number is "happy".
 
寫出一個演算法，判斷數字是否「開心」。

A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

一個開心的數字需要有以下幾點組成，從一個正整數開始，將他每個數字的平方加總起來，覆蓋過去。

不斷重複操作，直到數字變為 1 ，或是進到無盡迴圈永遠不會變成 1 。

那些數字能變成 1 的，即為「開心的數字」。

---

# 範例
Example: 19 is a happy number

``` swift
1^2 + 9^2 = 82
8^2 + 2^2 = 68
6^2 + 8^2 = 100
1^2 + 0^2 + 0^2 = 1
```

---

# 解題

首先先建立一個函式，將整數的每個數字拆開平方相加。
這個很簡單。

``` swift
func calculate(_ n: Int) -> Int {
    var sum = 0, n = n
    while (n > 0)  {
        let d = n % 10
        sum += d * d
        
        n /= 10
    }
    return sum
}
```

將上面的函式帶入 while 迴圈就可以不斷地重複像範例一樣直到整數變為 1 。

但如果答案不為 happy number 怎麼辦。
有兩種解法：

1. 建立一個 hash table 記錄每一次新的整數，如果在迴圈時，又碰到一次剛剛記錄的整數，那就代表迴圈是無盡的，跳出迴圈。

2. 利用 [Floyd Cycle Detection Algorithm](https://zh.wikipedia.org/wiki/Floyd%E5%88%A4%E5%9C%88%E7%AE%97%E6%B3%95) ，設計兩個不同速度的指針，只要指針在迴圈內再度相遇，那就代表這個迴圈中，存在著一個環，也是無盡的，在此跳出迴圈。

以下是使用 Floyd 判圈演算法的解法 :

``` swift
func isHappy(_ n: Int) -> Bool {
    var slow = n, fast = n
    
    repeat {
        slow = calculate(slow)
        fast = calculate(fast)
        fast = calculate(fast)
    } while slow != fast
    
    return slow == 1
}
```





