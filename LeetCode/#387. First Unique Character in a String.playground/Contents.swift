/* 2017. 9. 2
 
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
 從字串中找出第一個沒有重複的字元，並返回她的索引。如果沒有，則返回 -1 。
 
 Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 
 「leetcode」的第一個字元 l 沒有重複出現在字串中，所以回傳 0 。
 
 「loveleetcode」的第三個字元 v 沒有重複，所以回傳 2 。
 
 Note: You may assume the string contain only lowercase letters.
 
 可以假設字串中只有小寫的單字。
 
 */


/* Time Limit Exceeded

func firstUniqChar(_ s: String) -> Int {
    var index = -1
    var map = [Character: Int]()
    for c in s.characters {
        if var count = map[c] {
            count += 1
            map[c] = count
        } else {
            map[c] = 1
        }
    }
    for i in 0..<s.characters.count {
        let c = Array(s.characters)[i]
        if map[c] == 1 {
            index = i
            break
        }
    }
    return index
}
 */



/* AC Solution */

func firstUniqChar(_ s: String) -> Int {
    var alphabet = [Int?](repeating: nil, count: 26)
    
    for c in s.utf8 {
        let index = Int(c - 97)
        if var val = alphabet[index] {
            val += 1
            alphabet[index] = val
        } else {
            alphabet[index] = 1
        }
    }
    
    var index = 0
    for c in s.utf8 {
        if alphabet[Int(c - 97)] == 1 {
            return index
        }
        index += 1
    }
    return -1
}



firstUniqChar("aleetcode")

firstUniqChar("loveleetcode")







