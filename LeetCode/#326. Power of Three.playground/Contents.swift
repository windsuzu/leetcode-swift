/* 2017. 9. 29
 
 Given an integer, write a function to determine if it is a power of three.
 
 給予一個整數，找出他是否為 3 的某次方。
 
 Follow up:
 Could you do it without using any loop / recursion?
 
 能否不用任何迴圈 / 遞迴 ?
 
 */


/* Iterative Solution
func isPowerOfThree(_ n: Int) -> Bool {
    var x = n
    if x > 1 {
        while x % 3 == 0 {
            x /= 3
        }
    }
    return x == 1
}
 */



/* Recursive Solution
func isPowerOfThree(_ n: Int) -> Bool {
    return n > 0 && (n == 1 || (n % 3 == 0 && isPowerOfThree(n / 3)))
}
 */



// 1162261467 is 3^19,  3^20 is bigger than int
func isPowerOfThree(_ n: Int) -> Bool {
    return ( n > 0 && 1162261467 % n == 0)
}

isPowerOfThree(9)
isPowerOfThree(12)
print(5/3)




