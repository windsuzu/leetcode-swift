/* 2017. 10. 16
 
 Given an integer (signed 32 bits), write a function to check whether it is a power of 4.
 
 驗證整數是否為 4 的次方數。
 
 Example:
 Given num = 16, return true. Given num = 5, return false.
 
 輸入 16 回傳 true 。 5 則回傳 false
 
 Follow up: Could you solve it without loops/recursion?
 
 可不可以不使用迴圈或遞迴。
 
 */


func isPowerOfFour(_ num: Int) -> Bool {
    return num > 0 && num & (num-1) == 0 && num & 0x55555555 != 0
}

isPowerOfFour(1)
isPowerOfFour(4)
isPowerOfFour(5)
isPowerOfFour(8)
isPowerOfFour(16)
