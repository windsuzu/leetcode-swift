---
title: LeetCode#496 Next Greater Element I - in Swift
date: 2017-08-04 00:37:21
tags:
- LeetCode
- Swift
- Stack
categories: 
- LeetCode
- Swift
- Stack
---

# 題目

You are given two arrays (without duplicates) nums1 and nums2 where nums1’s elements are subset of nums2. Find all the next greater numbers for nums1's elements in the corresponding places of nums2.
 
The Next Greater Number of a number x in nums1 is the first greater number to its right in nums2. If it does not exist, output -1 for this number.


給兩個沒有重複元素的陣列 `nums1` & `nums2` ，其中 `nums1` 是 `nums2`的子集。
 
找出 `nums1` 對應於 `nums2` 的 next greater number ?_?
 
如果找到了，就把 `nums2` 對應的 next greater number 覆蓋回 `nums1` 原來的位子，如果找不到就覆蓋 `-1` 回去。


Example 1:
``` swift
 Input: nums1 = [4,1,2], nums2 = [1,3,4,2].
 Output: [-1,3,-1]
 
Explanation:
 For number 4 in the first array, you cannot find the next greater number for it in the second array, so output -1.
 For number 1 in the first array, the next greater number for it in the second array is 3.
 For number 2 in the first array, there is no next greater number for it in the second array, so output -1.
```
nums1 的 4 在 nums2 找不到比 4 更大的數。所以回傳 -1 回去 nums1 的第一個位子。
nums1 的 1 在 nums2 往右找找到 3 比他大。所以回傳 3 回去 nums1 的第二個位子。
nums1 的 2 在 nums2 的第四個位子，他的右邊沒人，沒辦法再往右找了。所以回傳 -1 回去 nums1 的第三個位子。




Example 2:
``` swift
 Input: nums1 = [2,4], nums2 = [1,2,3,4].
 Output: [3,-1]
 
Explanation:
 For number 2 in the first array, the next greater number for it in the second array is 3.
 For number 4 in the first array, there is no next greater number for it in the second array, so output -1.
```
 
nums1 的 2 在 nums2 往右找找到 3 比他大。所以回傳 3 回去 nums1 的第一個位子。
nums1 的 4 在 nums2 的第四個位子，他的右邊沒人，沒辦法再往右找了。所以回傳 -1 回去 nums1 的第二個位子。


# 第一次解題 : Wrong Answer 
 
第一次完全理解錯題目。以為是要比較該數字在陣列2的右邊數字。
結果不是比較右邊的，是往右一直尋遍找出有無比原數字大的數字。
第一個找出來的數字即是回傳值。
 
``` swift
func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
    var result = [Int]()
    for num in findNums {
        if let next = nums.index(of: num), next + 1 < nums.count {
            result.append(num < nums[next + 1] ? nums[next + 1] : -1)
        } else {
            result.append(-1)
        }
    }
    return result
}
```

# 第二次解題 : 299 ms
 
先給最右邊的數字，返回 -1
不為最右邊的數字，開始從下一個位子找到最後，找出where num < nums[i]的值
跳出迴圈並且賦值。

``` swift
func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
        var result = [Int]()
        for num in findNums {
            if let next = nums.index(of: num), next + 1 < nums.count {
                var value = -1
                for i in next + 1..<nums.count where num < nums[i] {
                    value = nums[i]
                    break
                }
                result.append(value)
            } else {
                result.append(-1)
            }
        }
        return result
}
```

# Best Solution From Java
看到了 Java [高度評論的解答](
 https://discuss.leetcode.com/topic/77916/java-10-lines-linear-time-complexity-o-n-with-explanation)雖然他使用的是 Java 中才有的 Stack Class，但我還是試著理解並且轉成了 swift 。


假設 nums 為 [6,5,4,3,2,1,7]， 那就可以知道全部數字的 greater number 是 6
先將 num 裝進 stack 中，不斷的裝進去，只要有數字 a 大於最上層的數字 b。
就將他加到 dict 裡 (a : b)，並且 pop 掉該數字 a 。
 
```
到 [6,5,4,3,2,1] 的時候都還沒觸發 while 內的事件。
7 出現後比對 1 -> dict[1:7] , stack -> [6,5,4,3,2]
比對 2 -> dict[1:7, 2:7] , stack -> [6,5,4,3]
比對 3 -> dict[1:7, 2:7, 3:7] , stack -> [6,5,4]
最後 dict[1:7, 2:7, 3:7, 4:7, 5:7, 6:7] , stack -> [7]
```

最後將 findNums [1,3,5,2,4] 遍尋一遍， 只要數字在 dict 裡面有存在 greater number 的就替換掉，不存在就換成 -1 。
發現在 dict 中都可以找到，所以回傳 [7,7,7,7,7]


``` swift
func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
    var result = findNums
    var dict = [Int: Int]()
    var stack = [Int]()
    
    for num in nums {
        while !stack.isEmpty && stack.last! < num {
            dict[stack.popLast()!] = num
        }
        stack.append(num)
    }
    for i in 0..<findNums.count {
        result[i] = dict[result[i]] ?? -1
    }
    return result
}
```

｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡ 








