/* 2017. 8. 12
 
 Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
 
 給一個不為負數的整數，重複的將每個位數的數字加起來，直到結果剩一個整數。
 
 For example:
 
 Given num = 38, the process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.
 
 例如 38 ， 3 + 8 = 11 ， 1 + 1 = 2 ， 2 不能再拆開了所以回傳 2 。
 
 Follow up:
 Could you do it without any loop/recursion in O(1) runtime?
 
 請解出題目但不使用「迴圈」或是「遞迴」函式。
 
 */


/* 第一次解題  45 ms
 
 這就是一題要算出數根 (Digital Root) 的題目。
 https://en.wikipedia.org/wiki/Digital_root#Congruence_formula
 
 要算出數根有二種方式 :
 
 第一種必須遵循 :
 
 b = 10
 
 dr(n) = 0 if n == 0
 dr(n) = (b-1) if n != 0 and n % (b-1) == 0
 dr(n) = n mod (b-1) if n % (b-1) != 0
 
 第二種 :
 
 dr(n) = 1 + (n-1) % 9
 
 可以發現除了 0 的數根為 0 以外，之後的數根皆由 1 ~ 9 不斷的循環。
 
 0 -> 0, 1 -> 1, 2 -> 2, ... 9 -> 9, 10 -> 1, 11 -> 2
 
 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
 0 1 2 3 4 5 6 7 8 9  1  2  3  4  5  6
 
 */

func addDigits(_ num: Int) -> Int {
    return 1 + (num - 1) % 9
}

addDigits(11)