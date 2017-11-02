/* 2017. 9. 14
 
 Given an integer, return its base 7 string representation.
 
 將數字從 10 進位轉為 7 進位。
 
 Example 1:
 
 Input: 100
 
 Output: "202"
 
 100 在七進位為 202
 
 Example 2:
 
 Input: -7
 
 Output: "-10"
 
 -7 在七進位為 -10
 
 */


func convertToBase7(_ num: Int) -> String {
    return String(num, radix: 7)
}


convertToBase7(-7)