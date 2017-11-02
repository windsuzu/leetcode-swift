/* 2017. 10. 2
 
 Given an integer, write a function to determine if it is a power of two.
 
 給個整數，寫個函式驗證他是否為 2 的平方數。
 
 */



/* Iterative
func isPowerOfTwo(_ n: Int) -> Bool {
    if n <= 0 { return false }
    var n = n
    while n % 2 == 0 { n /= 2 }
    return n == 1
}
*/

/* Bit Manipulation */
func isPowerOfTwo(_ n: Int) -> Bool {
    if n <= 0 { return false }
    return n & (n - 1) == 0
}


isPowerOfTwo(1)
isPowerOfTwo(0)
isPowerOfTwo(-4)
isPowerOfTwo(8)
isPowerOfTwo(30)
isPowerOfTwo(64)
