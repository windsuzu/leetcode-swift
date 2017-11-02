/* 2017. 9. 24
 
 Write an algorithm to determine if a number is "happy".
 
 寫出一個演算法，判斷數字是否「開心」。
 
 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
 
 一個開心的數字需要有以下幾點組成，從一個正整數開始，將他每個數字的平方加總起來，覆蓋過去。
 
 不斷重複操作，直到數字變為 1 ，或是進到無盡迴圈永遠不會變成 1 。
 
 那些數字能變成 1 的，即為「開心的數字」。
 
 
 
 Example: 19 is a happy number
 
 1^2 + 9^2 = 82
 8^2 + 2^2 = 68
 6^2 + 8^2 = 100
 1^2 + 0^2 + 0^2 = 1
 
 */

func calculate(_ n: Int) -> Int {
    var sum = 0, n = n
    while (n > 0)  {
        let d = n % 10
        sum += d * d
        
        n /= 10
    }
    return sum
}


func isHappy(_ n: Int) -> Bool {
    var slow = n, fast = n
    
    repeat {
        slow = calculate(slow)
        fast = calculate(fast)
        fast = calculate(fast)
    } while slow != fast
    
    return slow == 1
}

isHappy(17)

isHappy(19)


