/* 2017. 10. 15 
 
 Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
 You may assume the integer do not contain any leading zero, except the number 0 itself.
 
 The digits are stored such that the most significant digit is at the head of the list.
 
 利用陣列來表示一個非負數整數，不可包含前綴的 0 ，現在對這個整數加一 。
 
 Example:
 
 19 = [1,9] ， 19 + 1 = 20 = [2,0]。
 
 */

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    digits[digits.count - 1] += 1
    
    while digits.contains(10) {
        let i = digits.index(of: 10)!
        digits[i] = 0
        if i - 1 >= 0 {
            digits[i - 1] += 1
        } else {
            var new = [1]
            new.append(contentsOf: digits)
            digits = new
        }
    }
    return digits
}

plusOne([9, 9])



