---
title: LeetCode#292 Nim Game - in Swift
date: 2017-08-05 11:52:51
tags:
- LeetCode
- Swift
- Brainteaser
categories: 
- LeetCode
- Swift
- Brainteaser
---


# 題目
You are playing the following Nim Game with your friend: There is a heap of stones on the table, each time one of you take turns to remove 1 to 3 stones. The one who removes the last stone will be the winner. You will take the first turn to remove the stones.
 
Both of you are very clever and have optimal strategies for the game. Write a function to determine whether you can win the game given the number of stones in the heap.
 
For example, if there are 4 stones in the heap, then you will never win the game: no matter 1, 2, or 3 stones you remove, the last stone will always be removed by your friend.
 
 
你正在跟朋友玩一個遊戲叫 Nim Game ，桌上有好多個石頭，每個人輪流拿掉 1-3 個石頭，最後拿掉全部石頭的人即可獲勝。現在這個遊戲皆是由你先開始。
 
假設你跟你的朋友都很屌很有策略，不會錯失任何贏的機會。寫一個函式去判斷當石頭是 x 個的時候，你是否會贏得這次的比賽。
 
舉例來說，如果桌上有 4 個石頭，你先攻。那你永遠都不會贏。因為不管你第一步移走 1, 2, 3個石頭，最後一個一定是你朋友拿走。
 

# 第一次解題 : 16 ms
1. 可以發現，當最後石頭剩下 4 個的時候，不管你拿幾個石頭，最後一個一定是你的朋友拿走。
 
2. 所以剩 4 個的時候拿的人都會輸。
 
3. 把石頭數量翻倍， 4 < n < 8 ，也就是當 n = 5, 6, 7 時，可以發現都能夠把 死亡數字 4 留給對方。
 
4. 但是到 8 的時候，就變成對方能把死亡數字 4 給你了。
 
5. 所以 8 也是死亡數字。
 
6. 把石頭 * 3倍， 8 < n < 12 ，當 n = 9, 10, 11 ，都可以把 8 做球給對方，所以都會贏
 
7. 以此類推，當 n % 4 == 0 時， 你都會輸。


``` swift
func canWinNim(_ n: Int) -> Bool {
    return n % 4 != 0
}
```

這根本不是程式題目，是數學。
(／‵Д′)／~ ╧╧






