---
title: LeetCode#13 Roman to Integer - in Swift
date: 2017-09-06 15:12:39
tags:
- LeetCode
- Swift
- Math
- String
categories:
- LeetCode
- Swift
- Math
- String
---

# 題目
Given a roman numeral, convert it to an integer.
 
Input is guaranteed to be within the range from 1 to 3999.

將羅馬文字的數字轉換為一般數字。

範圍是 1 到 3999 。

>  題目敘述就只有這樣，好爛，所以找了一下羅馬數字圖表。
 http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm

簡單來說 : 
* I 代表 1
* V 代表 5 
* X 代表 10 
* L 代表 50 
* C 代表 100 
* D 代表 500 
* M 代表 1000


``` swift
I -> 1
II -> 2
III -> 3

// 但這種會比較特殊
IV -> 4
// 當小數字在大數字的前面時，變成大數字減小數字

// 繼續下去
V -> 5
VI -> 6
VII -> 7
VIII -> 8

// 又遇到一個，所以是 10 - 1
IX -> 9

// 繼續下去
X -> 10
XI -> 11
XII -> 12
XIII -> 13

// 特殊規則串插在中間
XIV -> 14

// Move on ...
XV -> 15
```

---

# 解題

先將一般規則記錄在字典中。

接著開始讀每一個羅馬數字，如果是正常的 「I」、「II」、「VIII」、「XII」，
就單純的將數字往上加上去。

但若是遇到前一個字母小於，之後的字母，例如 「IV」、「IX」、「XIX」中的「IX」，
就必須要有新的規則。
這時候再看到 「XL」 是 10 跟 50 ，結果卻變成 40 。
我們發現原來這種數字是要，後面的數字 - 前面的數字。

但因為是尋遍每個字母，尋到後面的字母時，需要把剛剛已經加進去的數字算進去，
所以要減去兩倍的前一個數字。

``` swift
答案 = 0

例如 XLIX ->

X -> 答案 = 10

// L 符合規則二 (L > X)
L -> 答案 = 10 + (50 - 2*10)

I -> 答案 = 10 + 30 + 1

// X 符合規則二 (X > I)
X -> 答案 = 10 + 30 + 1 + (10 - 2*1)
  
  -> 答案 = 10 + 30 + 1 + 8 = 49
```

![](../images/leetcode-13/roman.gif)



``` swift
func romanToInt(_ s: String) -> Int {
    var res = 0
    let dict: [Character : Int] =
        ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]
    
    let sArr = Array(s.characters)
    
    for i in 0..<sArr.count {
        
        if i - 1 >= 0 , dict[sArr[i]]! > dict[sArr[i - 1]]! {
            res += dict[sArr[i]]! - (2 * dict[sArr[i - 1]]!)
        } else {
            res += dict[sArr[i]]!
        }
    }
    return res
}
```




