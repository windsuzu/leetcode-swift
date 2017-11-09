/* 2017. 11. 4
 
 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
 
 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
 
 The order of output does not matter.
 
 給定字串 s 和不為空的字串 p ，找出所有 s 中可能包含 p 的重組字。
 
 兩個字串 s, p 皆只存在小寫英文字母，且長度不超過 20,100 。
 
 答案的順序不同沒關係。
 
 
 Example 1:
 
 Input:
 s: "cbaebabacd" p: "abc"
 
 Output:
 [0, 6]
 
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 
 "cbaebabacd" 中，從 0 開始的 cba 是 abc 的重組字，從 6 開始的 bac 也是 abc 的重組字。
 所以回傳 [0, 6]
 
 Example 2:
 
 Input:
 s: "abab" p: "ab"
 
 Output:
 [0, 1, 2]
 
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 
 "abab" 中，從 0 開始的 ab 是 ab 的重組字，從 1 開始的 ba 是 ab 的重組字，從 2 開始的 ab 也是 ab 的重組字。
 所以回傳 [0, 1, 2]
 
 */

func getHash(_ c: Character) -> Int {
    return Int(c.unicodeScalars.first!.value)
}

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var res = [Int]()
    var s = Array(s), p = Array(p)
    // 用來定義 ASCII 256 個字元符號的 Hash 表
    var hash = [Int](repeating: 0, count: 256)
    
    // 將 p 的字元裝進 Hash 表中
    for c in p {
        hash[getHash(c)] += 1
    }
    
    // 定義 Two Pointers ， left 代表重組字的起始位置， right 代表重組字的尾巴
    // 以及 p 的長度 (用來代表在 p 寬度內要完成所有的配對才算一個重組字)
    var left = 0 , right = 0 , count = p.count
    
    // 將 s 由 0 開始每次往右移 1 格
    while right < s.count {
        // 如果 hash 表中有存在該字元，就將 count - 1 代表越來越接近重組字。
        if hash[getHash(s[right])] >= 1 {
            count -= 1
        }
        // 對該字元對應在 hash 表 - 1 ， s 右移 1 格
        hash[getHash(s[right])] -= 1
        right += 1
        
        // 如果該次 count == 0 ，代表 count 內的字元皆可替換，找到一個重組字
        // 在答案中放入 left 的值
        if count == 0 { res.append(left) }

        // 如果 s 的字元已經走到一組 p 的長度了， left 也需要往右移一格
        if right - left == p.count {
            // 查看 hash 表的 left 是否有大於等於 0 ，如果有代表剛剛該 left 有被算入正確的重組字中
            // 所以要把 count + 1 平衡回去
            if hash[getHash(s[left])] >= 0 {
                count += 1
            }
            // 因為前面有將 hash 表該字元 - 1 ，所以要平衡回去
            hash[getHash(s[left])] += 1
            // left 往右移 1 格
            left += 1
        }
    }
    return res
}

findAnagrams("abab", "ab")
findAnagrams("cbaebabacd", "abc")
