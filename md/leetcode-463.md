---
title: LeetCode#463 Island Perimeter - in Swift
date: 2017-08-03 12:49:42
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
You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. 
Grid cells are connected horizontally/vertically (not diagonally).
The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). 
The island doesn't have "lakes" (water inside that isn't connected to the water around the island). 
One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

有一張小島的二維地圖， 1 代表土地， 0 代表海水。
方塊只有縱橫連接，沒有對角連接。
土地是被海水包圍成一座小島的，在這張地圖上只有一個小島，且小島是沒有湖的。
每個方塊的邊長皆為 1 ，地圖是方形長寬不會超過 100 ，請求出小島的周長。

Example:
```
[[0,1,0,0],
[1,1,1,0],
[0,1,0,0],
[1,1,0,0]]
```

Answer: 16
 Explanation: The perimeter is the 16 yellow stripes in the image below:

16條黃色圍起來的就是小島的周長。

 ![island](leetcode-463/island.png)



# 第一次解題 : Wrong Answer

![island-Commentary](leetcode-463/island_commentary.png)

可以發現 :
1.如果土地在第一行或最後一行的時候，該行的土地都要邊長 + 1
2.如果土地在第一列或最後一列的時候，該列的土地都要邊長 + 1
3.接下來找如果不在第一行時，上面的鄰居是土地時，邊長 + 1
4.如果不在最後一行時，下面的鄰居是土地時，邊長 + 1
5.接下來找如果不在第一列時，左邊的鄰居是土地時，邊長 + 1
6.如果不在最後一列時，右邊的鄰居是土地時，邊長 + 1

``` swift
func islandPerimeter(_ grid: [[Int]]) -> Int {
    var result = 0
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            var cellR = 0
            let cell = grid[i][j]
            if cell == 1 {
				cellR = (i == 0 || i == grid.count - 1) ? cellR + 1 : cellR
				cellR = (j == 0 || j == grid[i].count - 1) ? cellR + 1 : cellR
     
                if i != 0 {
                    cellR = (grid[i-1][j] == 0) ? cellR + 1 : cellR
                }
                
                if i != grid.count - 1 {
                    cellR = (grid[i+1][j] == 0) ? cellR + 1 : cellR
                }
                
                if j != 0 {
                    cellR = (grid[i][j-1] == 0) ? cellR + 1 : cellR
                }
                
                if j != grid[i].count - 1 {
                    cellR = (grid[i][j+1] == 0) ? cellR + 1 : cellR
                }
                result += cellR
            }
        }
    }
    return result
}
```


# 第二次解題 : 328 ms

第一次交答案的時候錯了，原來 [[1]] 也算一個地圖的一座島

所以下面兩個敘述是錯的 :
1.如果土地在第一行或最後一行的時候，該行的土地都要邊長 + 1
2.如果土地在第一列或最後一列的時候，該列的土地都要邊長 + 1

``` swift
cellR = (i == 0 || i == grid.count - 1) ? cellR + 1 : cellR
cellR = (j == 0 || j == grid[i].count - 1) ? cellR + 1 : cellR
```

應該是 :
1.如果土地在第一行，該行的土地都要邊長 + 1
2.如果土地在最後一行，該行的土地都要邊長 + 1
3.如果土地在第一列，該列的土地都要邊長 + 1
4.如果土地在最後一列，該列的土地都要邊長 + 1

``` swift
cellR = (i == 0) ? cellR + 1 : cellR
cellR = (i == grid.count - 1) ? cellR + 1 : cellR

cellR = (j == 0) ? cellR + 1 : cellR
cellR = (j == grid[i].count - 1) ? cellR + 1 : cellR
```


# Cool Soultion

找出他的規律發現，只要有兩個方塊合在一起，邊長就會少 2

```
+--+     +--+                   +--+--+
|  |  +  |  |          ->       |     |
+--+     +--+                   +--+--+
 
4 + 4 - ? = 6  -> ? = 2
```

所以找出`所有方塊 * 4` - `鄰居方塊 * 2`

``` swift
func islandPerimeter(_ grid: [[Int]]) -> Int {
    var islands = 0, neighbors = 0
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            if grid[i][j] == 1 {
                islands += 1
                if i < grid.count - 1 && grid[i+1][j] == 1 {
                    neighbors += 1
                }
                if j < grid[i].count - 1 && grid[i][j+1] == 1 {
                    neighbors += 1
                }
            }
        }
    }
    return islands * 4 - neighbors * 2
}
```




