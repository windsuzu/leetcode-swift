/* 2017. 11. 9
 
 Given two binary strings, return their sum (also a binary string).
 
 給兩個二元字串，返回他們的加總 (也是一個二元字串)。
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 
 "11" 十進位為 3 ， "1" 十進位為 1 ，相加為 4 ，二進位為 "100"

 */

func addBinary(_ a: String, _ b: String) -> String {
    let a = Array(a)
    let b = Array(b)
    var i = a.count, j = b.count
    var sum = [Character]()
    var carry = 0
    
    while i != 0 || j != 0 {
        var first = 0, second = 0
        if i - 1 >= 0 { first = Int(String(a[i - 1]))! }
        if j - 1 >= 0 { second = Int(String(b[j - 1]))! }
        
        var temp = first + second + carry
        carry = 0
        if temp >= 2 {
            temp -= 2
            carry += 1
        }
        sum.insert(Character(String(temp)), at: 0)
        
        if i != 0 { i -= 1 }
        if j != 0 { j -= 1 }
    }
    if carry == 1 { sum.insert(Character(String(carry)), at: 0) }
    return String(sum)
}


addBinary("0", "0")
addBinary("11", "1")
addBinary("10100111", "10011101")


