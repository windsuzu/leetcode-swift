---
title: LeetCode#566 Reshape the Matrix - in Swift
date: 2017-07-31 14:03:28
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
In MATLAB, there is a very useful function called 'reshape', which can reshape a matrix into a new one with different size but keep its original data.
 
You're given a matrix represented by a two-dimensional array, and two positive integers r and c representing the row number and column number of the wanted reshaped matrix, respectively.
 
The reshaped matrix need to be filled with all the elements of the original matrix in the same row-traversing order as they were.
 
If the 'reshape' operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.

將矩陣進行 'reshape' 的動作，將它變成新的 Size 但卻保留原來的 data 。
 
給一個用二維陣列表示的矩陣，再輸入兩個整數，一個 r 代表新的列數 (row) ， 一個 c 代表新的行數 (column) 。
 
如果給的參數皆為正確，就輸出 'reshape' 後的矩陣。相反，輸出原來矩陣。

Example 1:
> Input:
>> nums =
 [[1,2],
 [3,4]]
 r = 1, c = 4


> Output:
>> [[1,2,3,4]]

Explanation:
 The row-traversing of nums is [1,2,3,4]. The new reshaped matrix is a `1 * 4` matrix, fill it row by row by using the previous list.
 
 `2 * 2` 矩陣轉為 `1 * 4` 之後， 變為 1 row 分別填入 [1,2,3,4]


Example 2:
> Input:
>> nums =
 [[1,2],
 [3,4]]
 r = 2, c = 4

> Output:
>> [[1,2],
 [3,4]]

Explanation:
 There is no way to reshape a `2 * 2` matrix to a `2 * 4` matrix. So output the original matrix.

`2 * 2` 矩陣不可能變成 `2 * 4` ， 所以輸出原本的矩陣 [[1,2], [3,4]]。


# 第一次解題 : 142 ms

先將原矩陣鋪成 (flat) 單個 Array， 確保 flatArray 的元素數量 = `R * C` ，否則就直接返回原矩陣。
 
使用巢狀迴圈建立每個 Row， 再對每個 Row 依序塞進位在 flatArray 的元素，最後輸出。

``` swift
func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    
    var flatarray = nums.flatMap({ $0 })
    
    if flatarray.count != r*c {
        return nums
    }
    
    var reshaped = [[Int]]()
    
    for i in 0..<r {
        reshaped.append([Int]())
        for _ in 0..<c {
            reshaped[i].append(flatarray[0])
            flatarray.removeFirst()
        }
    }
    
    return reshaped
}
```


# Best Solution : 56 ms 
 
利用 elementArray 盛載 reshape 後每個 row 的 element 。
 
只要超過 column 數就把他裝進 resultArray 中，
 
如此下去直到填滿 resultArray 。

``` swift
func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    
    var resultArray:[[Int]] = Array.init()
    var elementArray:[Int] = Array.init()
    
    var elementCount:Int = 0;
    
    for firstArray in nums
    {
        for val in firstArray
        {
            elementArray.append(val)
            
            if(elementArray.count>=c)
            {
                resultArray.append(elementArray)
                elementArray.removeAll()
            }
            
            elementCount = elementCount+1
        }
    }
    
    if(elementCount != r * c)
    {
        resultArray = nums
    }
    
    return resultArray
}
```


