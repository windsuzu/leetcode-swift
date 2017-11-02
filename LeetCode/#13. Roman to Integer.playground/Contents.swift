/* 2017. 9. 6
 
 Given a roman numeral, convert it to an integer.
 
 Input is guaranteed to be within the range from 1 to 3999.
 
 將羅馬文字的數字轉換為一般數字。
 
 範圍是 1 到 3999 。
 
 題目敘述只有這樣，所以找了一下羅馬數字圖表。
 http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm
 
 */



/* 解題 */

func romanToInt(_ s: String) -> Int {
    var res = 0
    let dict: [Character : Int] =
        ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]
    
    let sArr = Array(s.characters)
    
    for i in 0..<sArr.count {
        
        if i - 1 >= 0 , dict[sArr[i]]! > dict[sArr[i - 1]]! {
            res += dict[sArr[i]]! - (2 * dict[sArr[i - 1]]!)
        } else {
            res += dict[sArr[i]]!
        }
    }
    return res
}



romanToInt("VIII")
romanToInt("IV")
romanToInt("XCIX")
romanToInt("DL")
romanToInt("DCCCXC")
romanToInt("MDCCC")
romanToInt("CM")
romanToInt("LXXVIII")









