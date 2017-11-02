/* 2017. 10 .14
 
 Given numRows, generate the first numRows of Pascal's triangle.
 
 給定行數 N ，返回 N 行的帕斯卡三角形。
 
 
 For example, given numRows = 5,
 Return
 
 [
        [1],
       [1,1],
      [1,2,1],
     [1,3,3,1],
    [1,4,6,4,1]
 ]
 
 */

func generate(_ numRows: Int) -> [[Int]] {
    var res = [[Int]]()
    if numRows == 0 { return res }
    res.append([1])
    if numRows == 1 { return res }
    res.append([1, 1])
    if numRows == 2 { return res }
    
    for i in 2..<numRows {
        var temp = [Int]()
        temp.append(1)
        
        let lastRow = res[i - 1]
        for i in 0..<lastRow.count {

            if i == lastRow.count - 1 {
                temp.append(1)
            } else {
                temp.append(lastRow[i] + lastRow[i + 1])
            }
        }
        res.append(temp)
    }
    return res
}

generate(10)