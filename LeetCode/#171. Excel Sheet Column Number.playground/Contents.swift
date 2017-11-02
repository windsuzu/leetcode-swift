/* 2017. 8. 24
 
 Given a column title as appear in an Excel sheet, return its corresponding column number.
 
 將 EXCEL 英文欄位轉為對應數字欄位。
 
 For example:
 
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 
 */



/* Solution 1
func titleToNumber(_ s: String) -> Int {
    
    var res = 0
    var cnt = 0
    
    for c in s.characters {
        let num = Int(String(c).unicodeScalars.first!.value % 64)
        res = res * 26 + num
        cnt += 1
    }
    return res
}
 */



/* Solution 2 */
func titleToNumber(_ s: String) -> Int {
    var res = 0
    for i in s.utf8 {
        res = res * 26 + (Int(i) - 64)
    }
    return res
}


titleToNumber("BC")
titleToNumber("AZ")








