/* 2017. 10. 26
 
 
 Given an integer n, return the number of trailing zeroes in n!.
 
 Note: Your solution should be in logarithmic time complexity.
 
 給定整數 n ，返回 n! 中有幾個後綴的 0 。
 
 */

func trailingZeroes(_ n: Int) -> Int {
    return n == 0 ? 0 : n / 5 + trailingZeroes(n / 5)
}


trailingZeroes(25)