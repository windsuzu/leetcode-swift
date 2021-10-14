---
title: LeetCode#461 Hamming distance - in Swift
date: 2017-07-23 09:03:46
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
The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
 
Given two integers x and y, calculate the Hamming distance.
 

兩個等長字符串之間的漢明距離是兩個字符串對應位置的不同字符的個數。
 
現在給兩個整數 x, y ，計算出它們的漢明距離。

Note:
 0 ≤ x, y < 231.
 
 
Example:
 
 Input: x = 1, y = 4
 
 Output: 2
 
 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ?   ?
 
 The above arrows point to positions where the corresponding bits are different.
 
 上面的 ？ 符號表示該 bits 不相同


# 科普
什麼是[漢明距離 (Hamming distance)](https://goo.gl/n4Cc69)

漢明距離是以理察·衛斯里·漢明的名字命名的，漢明在誤差檢測與校正碼的基礎性論文中首次引入這個概念。在通信中累計定長二進位字中發生翻轉的錯誤數據位，所以它也被稱為信號距離。漢明重量分析在包括`資訊理論`、`編碼理論`、`密碼學`等領域都有應用。但是，如果要比較兩個不同長度的字符串，不僅要進行替換，而且要進行插入與刪除的運算，在這種場合下，通常使用更加複雜的編輯距離等算法。


# 第一次解題 : Accepted

第一次解，想說把數字轉換成二位元字串
也就是使用 pad 這個方法取得兩個 binaryX 跟 binaryY
接下來就比對兩個字串每一個值是否有差異，就過了。。。

``` swift
func hammingDistance(_ x: Int, _ y: Int) -> Int {

    // How to convert Int to Binary in Swift : https://goo.gl/6m9TEY
    func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.characters.count) {
            padded = "0" + padded
        }
        return padded
    }
    
    let binaryX = pad(string: String(x, radix: 2), toSize: 32)
    let binaryY = pad(string: String(y, radix: 2), toSize: 32)
    
    var diff = 0
    
    for i in binaryX.characters.indices {
        let c1 = binaryX.characters[i]
        let c2 = binaryY.characters[i]
        
        if c1 != c2 {
            diff += 1
        }
    }
    
    return diff
}
```

# Other Best Practices
想想其實漢明距離就是要求兩個字符串的[互斥或閘 (exclusive or)](https://zh.wikipedia.org/wiki/%E9%80%BB%E8%BE%91%E5%BC%82%E6%88%96) 

也就是 x ^ y 的答案

``` swift
func hammingDistance(_ x: Int, _ y: Int) -> Int {
    let c = x ^ y
    return String(c, radix: 2).characters.filter { $0 == "1"}.count
}
```





