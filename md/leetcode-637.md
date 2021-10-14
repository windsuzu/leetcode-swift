---
title: LeetCode#637 Average of Levels in Binary Tree - in Swift
date: 2017-08-04 16:10:24
tags:
- LeetCode
- Swift
- Tree
categories: 
- LeetCode
- Swift
- Tree
---

# 題目
 
Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 
給一個不為空的二元樹，請求出這個二元樹每一層的平均值。


Example 1:
``` swift
Input:
     3
    / \
   9  20
      / \
     15  7
 
Output: [3, 14.5, 11]

Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
```

第 0 層平均值是 3 ， 第 1 層平均值是 (9+20)/2 = 14.5 ， 第 2 層是 11 。
 所以返回 [3, 14.5, 11] 。


# 第一次解題

假設二元樹長成這樣 :
``` swift
    3
   / \
  9  20
 / \
15  7
```

這一題要用[廣度優先搜索算法 (Breadth-First-Search，BFS)](https://goo.gl/WuKxn1) 下去演算。
跟[深度優先搜索算法 (Depth-First-Search，DFS)](https://goo.gl/ZPk1Ek) 不同， BFS 會去找出每層的節點，層層找下去。

所以建立一個 TreeNode 的陣列。
當陣列不為空時，迴圈該層的節點，刪除每個節點後，計算加總以及是否要加入該節點底下的節點進到陣列。

* 第一層
``` swift
queue = [3]

for 0..<1 {
	node = 3
	queue = [] // 刪掉 3
	sum = 3
	queue = [9, 20] // 3 的底下
}
average = 3 / 1
```

* 第二層
``` swift
queue = [9, 20]

for 0..<2 {
	node = 9
	queue = [20] // 刪掉 9
	sum = 9
	queue = [20, 15, 7] // 9 的底下

	---

	node = 20
	queue = [15, 7] // 刪掉 20
	sum = 9 + 20
	queue = [15, 7] // 15 的底下沒有東西
}
average = 29 / 2
```

* 第三層
``` swift
queue = [15, 7]

for 0..<2 {
	node = 15
	queue = [7] // 刪掉 15
	sum = 15
	queue = [7] // 15 底下沒東西

	---

	node = 7
	queue = [] // 刪掉 7
	sum = 15 + 7
	queue = [] // 7 底下沒東西
}
```

* 跳出 while 迴圈


``` swift
func averageOfLevels(_ root: TreeNode?) -> [Double] {
    var result = [Double]()
    guard let root = root else {
        return result
    }
    
    var queue = [root]
    
    while !queue.isEmpty {
        let n = queue.count
        var sum = 0
        for _ in 0..<n {
            let node = queue.removeFirst()
            sum += node.val
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        let average = Double(sum) / Double(n)
        result.append(average)
    }
    return result
}
```









