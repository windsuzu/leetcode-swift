/* 2017. 11. 5
 
 We define the Perfect Number is a positive integer that is equal to the sum of all its positive divisors except itself.
 
 Now, given an integer n, write a function that returns true when it is a perfect number and false when it is not.
 
 我們定義一個「完美數」是一個正整數，且他的全部因數除了自己本身，加起來等於他自己。
 
 現在給你一整數 n ，寫出一個函式驗證該數是否為完美數。
 
 Example:
 
 Input: 28
 
 Output: True
 
 Explanation: 28 = 1 + 2 + 4 + 7 + 14
 
 28 的全部因數有 1, 2, 4, 7, 14, 28 ，排除 28 ，其他加起來又等於 28 ，所以返回 true
 
 */


/* Time Limit Exceeded */
func checkPerfectNumberTLE(_ num: Int) -> Bool {
    var sum = 0
    for i in 1..<num {
        if num % i == 0 { sum += i }
    }
    return sum == num
}


/* AC */
import Foundation
func checkPerfectNumber(_ num: Int) -> Bool {
    if num <= 1 { return false }
    
    var sum = 1, i = 2, s = Int(sqrt(Double(num)))
    while i <= s {
        if num % i == 0 { sum += i + (num / i) }
        i += 1
    }
    
    return sum == num
}

checkPerfectNumber(1)
checkPerfectNumber(-6)
checkPerfectNumber(28)



