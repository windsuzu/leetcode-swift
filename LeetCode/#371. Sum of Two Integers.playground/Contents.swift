/* 2017. 8. 11
 
 Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.
 
 實現加法但不使用 "+" 或 "-" 。
 
 Example:
 Given a = 1 and b = 2, return 3.
 
 */

func pad(string : String, toSize: Int) -> String {
    var padded = string
    for _ in 0..<(toSize - string.characters.count) {
        padded = "0" + padded
    }
    return padded
}

func printBinary(_ int : Int) {
    print(pad(string: String(int, radix: 2), toSize: 4))
}



/* 第一次解題 
 
 加法可以用 XOR (^) 來取得， 而進位可以透過 AND (&) 取得。
 
 如果 a 和 b 的二進制沒有 bits 在相同位置那就可以透過 ^ 直接取得相加值。
 例如 1(0001) ^ 4(0100) =  5(0101)
 例如 8(1000) ^ 7(0111) =  15(1111)
 
 
 那如果要對有相同位置的兩個 a 和 b 操作加法，就必須要用到 & 。
 & 能夠給我們 a 和 b 所有的進位 bits 。
 
 例如 5(0101) & 9(1001) = 1(0001)
 例如 1(0001) & 5(0101) = 1(0001)
 
 
 所以我們先算出 (a & b) << 1 並且將它加進 a ^ b 中。
 
 以 5 + 9 為例 :
 5(0101) & 9(1001) << 1 = 1(0001) << 1 = 2(0010)
 5(0101) ^ 9(1001) = 12(1100)
 12(1100) ^ 2(0010) = 14(1110)
 
 
 以 1 + 1 為例 :
 1 & 1 << 1 = 2
 1 ^ 1 = 0
 0 ^ 2 = 2
 

func getSum(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let carry = a & b
        a ^= b
        b = carry << 1
    }
    return a
}
 
*/


/* Recursive Solution
 
func getSum(_ a: Int, _ b: Int) -> Int {
    let result = a ^ b
    let carry = (a & b) << 1
    if carry != 0 {
        return getSum(result, carry)
    }
    return result
}
 
 */




/* One Line Solution */
func getSum(_ a: Int, _ b: Int) -> Int {
    print(a)
    print(b)
    print("--")
    return b==0 ? a : getSum(a ^ b, (a & b) << 1)
}

getSum(60, 40)
