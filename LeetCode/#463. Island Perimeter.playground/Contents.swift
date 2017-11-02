/* 2017. 8. 3 
 
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
 
 [[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]
 
 Answer: 16
 Explanation: The perimeter is the 16 yellow stripes in the image below:
 
 */


/* 第一次解題 Wrong Answer [[1]] */
//func islandPerimeter(_ grid: [[Int]]) -> Int {
//    var result = 0
//    for i in 0..<grid.count {
//        for j in 0..<grid[i].count {
//            var cellR = 0
//            let cell = grid[i][j]
//            if cell == 1 {
//                cellR = (i == 0 || i == grid.count - 1) ? cellR + 1 : cellR
//                cellR = (j == 0 || j == grid[i].count - 1) ? cellR + 1 : cellR
//                
//                if i != 0 {
//                    cellR = (grid[i-1][j] == 0) ? cellR + 1 : cellR
//                }
//                
//                if i != grid.count - 1 {
//                    cellR = (grid[i+1][j] == 0) ? cellR + 1 : cellR
//                }
//                
//                if j != 0 {
//                    cellR = (grid[i][j-1] == 0) ? cellR + 1 : cellR
//                }
//                
//                if j != grid[i].count - 1 {
//                    cellR = (grid[i][j+1] == 0) ? cellR + 1 : cellR
//                }
//                result += cellR
//            }
//        }
//    }
//    return result
//}




// 第二次解題 : 328 ms
//func islandPerimeter(_ grid: [[Int]]) -> Int {
//    var result = 0
//    for i in 0..<grid.count {
//        for j in 0..<grid[i].count {
//            var cellR = 0
//            let cell = grid[i][j]
//            if cell == 1 {
//                cellR = (i == 0) ? cellR + 1 : cellR
//                cellR = (i == grid.count - 1) ? cellR + 1 : cellR
//                
//                cellR = (j == 0) ? cellR + 1 : cellR
//                cellR = (j == grid[i].count - 1) ? cellR + 1 : cellR
//     
//                if i != 0 {
//                    cellR = (grid[i-1][j] == 0) ? cellR + 1 : cellR
//                }
//                
//                if i != grid.count - 1 {
//                    cellR = (grid[i+1][j] == 0) ? cellR + 1 : cellR
//                }
//                
//                if j != 0 {
//                    cellR = (grid[i][j-1] == 0) ? cellR + 1 : cellR
//                }
//                
//                if j != grid[i].count - 1 {
//                    cellR = (grid[i][j+1] == 0) ? cellR + 1 : cellR
//                }
//                result += cellR
//            }
//        }
//    }
//    return result
//}



/* Cool Solution
 
 +--+     +--+                   +--+--+
 |  |  +  |  |          ->       |     |
 +--+     +--+                   +--+--+
 
 4 + 4 - ? = 6  -> ? = 2
 
 因為只要有兩個方塊合在一起，邊長就會少 2
 所以找出所有方塊 * 4 - 鄰居方塊 * 2
 
 */

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





islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]])
islandPerimeter([[1]])
