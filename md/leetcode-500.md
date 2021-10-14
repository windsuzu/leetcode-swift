---
title: LeetCode#500 Keyboard Row - in Swift
date: 2017-07-29 17:22:55
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

Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
 
給一串單詞陣列，從每一個單詞篩選出單詞全部的字母都位在鍵盤上同一行。
要以下方鍵盤圖片為標準 :
![Keyboard](leetcode-500/keyboard.png)

 
Example 1:
 Input: ["Hello", "Alaska", "Dad", "Peace"]
 Output: ["Alaska", "Dad"]
 
例如 Alaska 與 Dad 都位在 ASDFGHJKL 這行，所以就挑出來。
 
 
Note:
 You may use one character in the keyboard more than once.
 You may assume the input string will only contain letters of alphabet.
 
 假定每個字元都會用到一次以上。
 假定每個輸入的東西都是 a-z 字母。


# 第一次解題 : Accepted
``` swift
func findWords(_ words: [String]) -> [String] {
    
    let rules =  ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
    var result = words
    
    words.forEach { word in
        // 如果單詞不在規則內就把它 filter 掉
        if (checkWords(word: word.uppercased())) {
            result = result.filter { $0 != word }
        }
    }
    
    
    // 定義 checkWords 函式確認是否該單字都在鍵盤同一行
    // true 表示該刪除， false 相反
    func checkWords(word: String) -> Bool {
        
        // 使用第一個單字來判斷這個單詞應該要對應哪一個單字
        
        let rule = rules.filter { $0.range(of: String(word.characters.first!)) != nil }
        
        // 如果單字不在該規則中，就直接返回 true
        for c in word.characters {
            if (rule.first!.range(of: String(c))) == nil {
                return true
            }
        }
        
        return false
    }
    
    return result
}
```


# Best Solution ? For Java
因為有神人使用正規式解答，但是我沒有精通，所以不知道在 Swift 要怎麼寫。。。
先放上 Java 的代碼，等哪天我會了再來解釋。

``` java
public String[] findWords(String[] words) {
    return Stream.of(words).filter(s -> s.toLowerCase().matches("[qwertyuiop]*|[asdfghjkl]*|[zxcvbnm]*")).toArray(String[]::new);
}
```


