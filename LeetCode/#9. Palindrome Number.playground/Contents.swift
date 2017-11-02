/* 2017. 10. 29
 
 Determine whether an integer is a palindrome. Do this without extra space.
 
 驗證一個整數是否為回文。不能使用額外的空間來操作。
 
 */

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 || (x > 0 && x % 10 == 0) { return false }
    var x = x
    var reverse = 0
    
    while x > reverse {
        reverse = reverse * 10 + x % 10
        x /= 10
    }
    return reverse == x || reverse / 10 == x
}


isPalindrome(11)
isPalindrome(122221)
isPalindrome(1)