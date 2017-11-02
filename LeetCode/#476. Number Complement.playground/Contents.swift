/* 2017. 7. 28
 
 Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.
 
 給一個正整數，算出他的二補數 (2's complement)。 二補數就是將該數字的二進制碼全部翻轉過來。
 
 
 Note:
 The given integer is guaranteed to fit within the range of a 32-bit signed integer.
 You could assume no leading zero bit in the integer’s binary representation.
 
 
 
 Example 1:
 Input: 5
 Output: 2
 Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
 
 由於 5 的二進制是 101 ， 所以他的補數便是 010 ， 整數是 2
 
 
 
 Example 2:
 Input: 1
 Output: 0
 Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
 
 由於 1 的二進制是 1 ， 所以他的補數便是 0 ， 整數是 0
 
 
 */



/* 第一次解題 : Accepted
 
 將數字轉為二進制，尋遍二進制碼將數字轉換。
 
 */

//func findComplement(_ num: Int) -> Int {
//    
//    let binary = String(num, radix: 2)
//    
//    var complement: String = ""
//    for c in binary.characters {
//        complement += c == "0" ? "1" : "0"
//    }
//    
//    print(complement)
//    return Int(complement, radix: 2)!
//}


/* Best Solution
 
 遍尋一遍是很耗資源的做法。
 所以要使用二元運算的方法來解。
 
 1. 先取得與二進制 num 相同長度的 mask -> 
    5(101) -> 111
    9(1001) -> 1111
 
 2. 以 5(101) 舉例，取得 Most Significant Bit 就是影響這個數串最大的數字，也就是最左邊的數 -> (1)01。
    Java 有內建 `Integer.highestOneBit(num)` 的方法，但 Swift 只能自己手動建立，取得除了最大數為1其他數為0的值 -> (1)00
    接著對該數字利用下溢位 -1 ，取得 mask -> 111
 
 3. 取得 mask 後，解題方法有二:
 
    3-1: 使用 ^ 運算子，相同數 XOR 交換
        num(101) ^ mask(111) = 010
 
    3-2: 使用 ~ 跟 & 運算子，對 num 作 NOT 運算取補數，並且跟 mask 作 AND 運算
        ~num(101) & 111 = 010
            -> 11111111111111111111111111111010 & 0000...111 = 010
 
 */


func findComplement(_ num: Int) -> Int {
    var mask = 1
    while(mask <= num) {
        mask <<= 1
    }
    mask-=1
    return num ^ mask
}

findComplement(9)
