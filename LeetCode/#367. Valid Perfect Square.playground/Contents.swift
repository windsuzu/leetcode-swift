/* 2017. 10. 18
 
 Given a positive integer num, write a function which returns True if num is a perfect square else False.
 
 給一正整數，驗證其是否為一個完全平方數。
 
 Note: Do not use any built-in library function such as sqrt.
 
 不使用任何語法中的 sqrt 函式。
 
 Example 1:
 
 Input: 16
 Returns: True
 
 
 
 Example 2:
 
 Input: 14
 Returns: False
 
 */


/* Sqrt Solution */

func isPerfectSquareSqrt(_ num: Int) -> Bool {
    var x = num
    while x * x > num {
        x = (x + (num/x)) / 2
    }
    return x * x == num
}

isPerfectSquareSqrt(16)



/* Binary Search Solution */

func isPerfectSquareBinary(_ num: Int) -> Bool {
    var (left, right) = (1, num)
    while left <= right {
        let mid = (left + right) / 2
        if mid * mid == num {
            return true
        } else if mid * mid > num {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return false
}

isPerfectSquareBinary(16)