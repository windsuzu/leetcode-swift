/* 2017. 10. 24
 
 Given an index k, return the kth row of the Pascal's triangle.
 
 給定索引值 k ，返回帕斯卡三角形的第 k+1 層。
 
 For example, given k = 3,
 Return [1,3,3,1].
 
 */



func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex == 0 { return [1] }
    var res = [Int](repeating: 0, count: rowIndex + 1)
    res[0] = 1
    for i in 1...rowIndex {
        var j = i
        while j >= 1 {
            res[j] += res[j - 1]
            j -= 1
        }
    }
    return res
}



getRow(0)
getRow(1)
getRow(2)
getRow(3)
getRow(4)
