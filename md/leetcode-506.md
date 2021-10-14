---
title: LeetCode#506 Relative Ranks - in Swift
date: 2017-09-04 14:17:43
tags:
- LeetCode
- Swift
categories:
- LeetCode
- Swift
---

# 題目

Given scores of N athletes, find their relative ranks and the people with the top three highest scores, who will be awarded medals: "Gold Medal", "Silver Medal" and "Bronze Medal".
 
有 N 個運動員，請從他們每個人的分數，排序出他們每個人所得到的排名。

前三名需要頒發給他們獎牌 : "Gold Medal", "Silver Medal" and "Bronze Medal" 。


Example 1:

``` swift
Input: [5, 4, 3, 2, 1]

Output: ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"]

Explanation: The first three athletes got the top three highest scores, so they got "Gold Medal", "Silver Medal" and "Bronze Medal".
For the left two athletes, you just need to output their relative ranks according to their scores.
```

5, 4, 3 分別拿到前三高的成績，所以分別獲得金、銀、銅牌。
剩下的 2, 1 只需要給予他們對應的名次， 4 和 5 名。

---

# 解題

利用 Sort 將	分數由高到小排列，可以得到每個人的排名，但是卻失去原本的索引。

``` swift
[9, 3, 7, 8, 4] -> [9, 8, 7, 4, 3]
```

所以再添加一層陣列，放入這些選手的位置，重新藉由分數 Sort 一次。

``` swift
[[9,0], [3,1], [7,2], [8,3], [4,4]] -> [[9,0], [8,3], [7,2], [4,4], [3,1]]
```

這時候就可以將排名發放給選手，並且帶到選手所在的位置。

``` swift
Gold Medal -> [9,0] // 在第一個位置
[Gold, "", "", "", ""]

Sliver Medal -> [8,3] // 在第四個位置
[Gold, "", "", "Sliver", ""]

Bronze Medal -> [7,2] // 在第三個位置
[Gold, "", "Bronze", "Sliver", ""]

Fourth -> [4,4] // 在第五個位置
[Gold, "", "Bronze", "Sliver", "4"]

Fifth -> [3,1] // 在第二個位置
[Gold, "5", "Bronze", "Sliver", "4"]
```

![](leetcode-506/ranks.gif)


``` swift
func findRelativeRanks(_ nums: [Int]) -> [String] {
    var pair = [Int](repeating: 0, count: 2)
    var pairs = [[Int]]()
    var count = nums.count
    var res = [String](repeating: "", count: count)
    
    for i in 0..<nums.count {
        pair[0] = nums[i]
        pair[1] = i
        pairs.append(pair as! [Int])
    }
    
    pairs = pairs.sorted { $1[0] < $0[0] }
    
    for i in 0..<nums.count {
        if i == 0 {
            res[pairs[i][1]] = "Gold Medal"
        } else if i == 1 {
            res[pairs[i][1]] = "Silver Medal"
        } else if i == 2 {
            res[pairs[i][1]] = "Bronze Medal"
        } else {
            res[pairs[i][1]] = "\(i + 1)"
        }
    }
    return res
}
```



