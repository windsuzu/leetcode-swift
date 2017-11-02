/* 2017. 9. 23
 
 Given an integer, write an algorithm to convert it to hexadecimal. For negative integer, two’s complement method is used.
 
 給一整數，設計函式將他轉換為 16 進位。 如果是負數，需使用到二補數。
 
 Note:
 
 All letters in hexadecimal (a-f) must be in lowercase.
 
 The hexadecimal string must not contain extra leading 0s. If the number is zero, it is represented by a single zero character '0'; otherwise, the first character in the hexadecimal string will not be the zero character.
 
 The given number is guaranteed to fit within the range of a 32-bit signed integer.
 
 You must not use any method provided by the library which converts/formats the number to hex directly.
 
 所有 16 進位的字元 (a-f) 皆須小寫。
 
 16 進位的字元不可包含前綴 0 。
 
 保證所有輸入的數字皆在 32-bit signed integer 的範圍。
 
 你不可以使用語法內建的函式來作答。
 
 */


let map = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]

func toHex(_ num: Int) -> String {
    if num == 0 { return "0" }
    var num = num
    var res = ""
    var i = 0
    
    while num != 0 && i < 8 {
        res = map[num & 15] + res
        num >>= 4
        i += 1
    }
    return res
}

toHex(-1)
toHex(123)




