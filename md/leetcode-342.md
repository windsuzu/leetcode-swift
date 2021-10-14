---
title: LeetCode#342 Power of Four - in Swift
date: 2017-10-16 14:45:02
tags:
- LeetCode
- Swift
- Bit Manipulation
categories:
- LeetCode
- Swift
- Bit Manipulation
---

# 題目
Given an integer (signed 32 bits), write a function to check whether it is a power of 4.

驗證整數是否為 4 的次方數。

Follow up: Could you solve it without loops/recursion?

可不可以不使用迴圈或遞迴。

---

# 範例
Given num = 16, return true. Given num = 5, return false.

輸入 16 回傳 true
輸入 5 則回傳 false

---

# 解題

要達成 4 的次方數，需要符合三個條件:

1. 4 的次方數一定大於 0

2. 4 的次方數在 Bit 中，一定只有開頭為 1
   如 4(100), 16(10000), 64(1000000), 256(100000000)

   為了驗證只有開頭為 1 ，只要和未進位的前一個數字做 & 運算，得出 0 即可。
   如 4(100) & 3(011) = 0,  16(10000) & 15(01111) = 0

3. 除了 4 的次方數只有開頭為 1 以外， 2 的次方數也是如此。
   但 4 的次方數還有一點不同於 2 的次方數，也就是 1 所在的位置。
   4 的次方數的 1 一律位在奇數的位置，如 100 在 3 ， 10000 在 5 ， 1000000 在 7 ...

   要驗證 1 是否在奇數位置，與 0x55555555 做 & 運算，得出不為 0 的答案即可。
   0x55555555 在 Bit 中為 01010101010101010101010101010101
   可以對應到奇數位置是否存在。


``` swift
func isPowerOfFour(_ num: Int) -> Bool {
    return num > 0 && num & (num-1) == 0 && num & 0x55555555 != 0
}
```


