/* 2017. 10. 27
 
 You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.
 
 Given n, find the total number of full staircase rows that can be formed.
 
 n is a non-negative integer and fits within the range of a 32-bit signed integer.
 
 給你 n 個硬幣排成樓梯的形狀，每 k 層有 k 個硬幣。
 
 現在給你 n ， 返回你最大可以排成的樓梯有幾層。 n 為一個非負數整數。
 
 
 Example 1:
 
 n = 5
 
 The coins can form the following rows:
 ¤
 ¤ ¤
 ¤ ¤
 
 Because the 3rd row is incomplete, we return 2.
 
 5 個硬幣排完第 3 層還沒完成，所以返回 2 。
 
 Example 2:
 
 n = 8
 
 The coins can form the following rows:
 ¤
 ¤ ¤
 ¤ ¤ ¤
 ¤ ¤
 
 Because the 4th row is incomplete, we return 3.
 
 8 個硬幣排完第 4 層還沒完成，所以返回 3 。
 
 */


func arrangeCoinsIterative(_ n: Int) -> Int {
    var n = n
    for i in 1...Int.max {
        if n - i >= 0 {
            n -= i
        } else {
            return i - 1
        }
    }
    return 0
}



import Foundation
func arrangeCoinsMathematic(_ n: Int) -> Int {
    return Int((sqrt(8 * Double(n) + 1) - 1) / Double(2))
}


arrangeCoinsIterative(2000)
arrangeCoinsMathematic(2000)






