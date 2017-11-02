/* 2017. 10. 3
 
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 你正在爬樓梯，需要花 n 步可以走到頂端。
 
 每一步你可以踩 1 或 2 格樓梯。
 
 請問你有幾種方法可以走到頂端 ?
 
 
 
 Note: Given n will be a positive integer.
 
 n 會是正整數。
 
 */

func climbStairs(_ n: Int) -> Int {
    if n <= 0 { return 0 }
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    
    var res = 0
    var n1 = 1
    var n2 = 2
    
    for _ in 2..<n {
        res = n1 + n2
        n1 = n2
        n2 = res
    }
    return res
}


climbStairs(4)
