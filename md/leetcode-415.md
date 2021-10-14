---
title: LeetCode#415 Add Strings - in Swift
date: 2017-09-21 14:20:50
tags:
- LeetCode
- Swift
- Math
categories:
- LeetCode
- Swift
- Math
---

# 題目

Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.
 
給兩個非負數的 Integer num1 和 num2 但以 String 呈現，返回兩數加總。

> Note:
The length of both num1 and num2 is < 5100.
Both num1 and num2 contains only digits 0-9.
Both num1 and num2 does not contain any leading zero.
You must not use any built-in BigInteger library or convert the inputs to integer directly.

num1 和 num2 的長度 < 5100。
num1 和 num2 字串中只包含 0-9。
num1 和 num2 不會包含前綴的 0。
不可以使用內建的 BigInteger 函數，或者將 String 直接轉為 Integer 操作。

---

# 解題

將兩數轉為 UnicodeScalar ，並且從尾巴開始算起。

將數字減去 0 的 UnicodeScalar ，就可以得到該數字位於 0-9 的值。

再來就是利用 carry 來算出 10 進位結果即可。

## 解法一
``` swift
func addStrings(_ num1: String, _ num2: String) -> String {
    var arr1:[UnicodeScalar] = num1.unicodeScalars.reversed()
    var arr2:[UnicodeScalar] = num2.unicodeScalars.reversed()
    var res = ""
    var carry = 0
    var index = 0
    
    while index < arr1.count || index < arr2.count {
        var n1 = 0
        var n2 = 0
        
        if index < arr1.count {
            let ch1 = arr1[index];
            n1 = Int(ch1.value) - Int("0".unicodeScalars.first!.value)
        }
        if index < arr2.count {
            let ch2 = arr2[index];
            n2 = Int(ch2.value) - Int("0".unicodeScalars.first!.value)
        }
        
        let sum = n1 + n2 + carry
        res = String(sum % 10) + res
        carry = sum / 10
        index += 1
    }
    if carry > 0 {
        res = String(carry) + res
    }
    
    return res
}
```


## 解法二

將兩數都轉為字串陣列，做迴圈直到最長的數字結束。

迴圈從兩個數的尾端將每圈的兩數加總，超過 9 就進位，沒超過就加在答案的前面。

最後查看有無多餘的 carry ，有一樣加在答案前面。

``` swift
func addStrings(_ num1: String, _ num2: String) -> String {
    let arr1 = Array(num1.characters)
    let arr2 = Array(num2.characters)
    var carry = 0
    var res = ""
    
    for i in 0..<max(arr1.count, arr2.count){
        if arr1.count - i - 1 >= 0 {
            carry += Int(String(arr1[arr1.count - i - 1]))!
        }
        if arr2.count - i - 1 >= 0 {
            carry += Int(String(arr2[arr2.count - i - 1]))!
        }
        
        if carry > 9 {
            res = String(carry-10) + res
            carry = 1
        } else {
            res = String(carry) + res
            carry = 0
        }
    }
    
    if carry > 0 {
        res = String(carry) + res
    }
    return res
}
```

### 過程

``` swift
Input : "87" , "85"

res = ""

--- Loop Begin --- 
{
	carry += 7
	carry += 5

	// carry = 13

	carry > 9 {
		res = "13 - 10" + "" = "3"
		carry = 1
	}

	---

	carry += 8
	carry += 8

	// carry = 17

	carry > 9 {
		res = "17 - 10" + "3" = "73"
		carry = 1
	}
} 
--- Loop End ---

carry > 0 {
	res = "1" + "73" = "173"
}

Output : "173"
```

