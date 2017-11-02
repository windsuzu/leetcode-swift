
/* 2017. 7. 23
 
 漢明距離 (Hamming distance) : https://goo.gl/n4Cc69
 
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
 
 Given two integers x and y, calculate the Hamming distance.
 
 
 兩個等長字符串之間的漢明距離是兩個字符串對應位置的不同字符的個數。
 
 現在給兩個整數 x, y ，計算出它們的漢明距離。
 
 Note:
 0 ≤ x, y < 231.
 
 
 Example:
 
 Input: x = 1, y = 4
 
 Output: 2
 
 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ?   ?
 
 The above arrows point to positions where the corresponding bits are different.
 
 上面的？符號表示 bits XOR
 
 */


// 第一次解題 Accepted

//func hammingDistance(_ x: Int, _ y: Int) -> Int {
//    
//    
//    // How to convert Int to Binary in Swift : https://goo.gl/6m9TEY
//    func pad(string : String, toSize: Int) -> String {
//        var padded = string
//        for _ in 0..<(toSize - string.characters.count) {
//            padded = "0" + padded
//        }
//        return padded
//    }
//    
//    let binaryX = pad(string: String(x, radix: 2), toSize: 32)
//    let binaryY = pad(string: String(y, radix: 2), toSize: 32)
//    
//    var diff = 0
//    
//    for i in binaryX.characters.indices {
//        let c1 = binaryX.characters[i]
//        let c2 = binaryY.characters[i]
//        
//        if c1 != c2 {
//            diff += 1
//        }
//    }
//    
//    return diff
//}




// BEST SOLUTION FOR SWIFT

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    let c = x ^ y
    return String(c, radix: 2).characters.filter { $0 == "1"}.count
}


print(hammingDistance(112, 4))

