/* 2017. 11. 2
 
 Given two strings s and t, determine if they are isomorphic.
 
 Two strings are isomorphic if the characters in s can be replaced to get t.
 
 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.
 
 給定兩個字串 s 和 t ，驗證他們是否同構。
 
 兩個字串要達成同構， s 字串比需要能被 t 完全取代。
 
 完全取代指的是每一個被取代的字元，可以被自己本身取代，但不能有一個字元被兩個以上不同字元取代的狀況發生。
 
 Note:
 You may assume both s and t have the same length.
 
 你可以假設 s 和 t 為相同長度。
 
 For example,
 Given "egg", "add", return true.
 
 Given "foo", "bar", return false.
 
 Given "paper", "title", return true.
 
 */


/* Time Limit Exceeded */
func isIsomorphicFail(_ s: String, _ t: String) -> Bool {
    var dict = [Character: Character]()
    for i in 0..<s.characters.count {
        if let pre = dict[Array(s)[i]] {
            if pre != Array(t)[i] { return false }
        } else if dict.values.contains(Array(t)[i]) {
            return false
        } else {
            dict[Array(s)[i]] = Array(t)[i]
        }
    }
    return true
}

/* Time Limit Exceeded */
func isIsomorphicFailAgain(_ s: String, _ t: String) -> Bool {
    var arr1 = [Int](repeating: 0, count: 256)
    var arr2 = [Int](repeating: 0, count: 256)
    let n = s.count
    for i in 0..<n {
        let asc1 = Int(Array(s)[i].unicodeScalars.first!.value)
        let asc2 = Int(Array(t)[i].unicodeScalars.first!.value)
        if arr1[asc1] != arr2[asc2] { return false }
        arr1[asc1] = i + 1
        arr2[asc2] = i + 1
    }
    return true
}

/* Swift is bad */
func isIsomorphicFailAgainAndAgain(_ s: String, _ t: String) -> Bool {
    var arr = [Int](repeating: 0, count: 512)
    for i in 0..<s.count {
        let char1 = Int(Array(s.characters)[i].unicodeScalars.first!.value)
        let char2 = Int(Array(t.characters)[i].unicodeScalars.first!.value)
        if arr[char1] != arr[char2 + 256] { return false }
        arr[char1] = i + 1
        arr[char2 + 256] = i + 1
    }
    return true
}


func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var dict = [Character: Character]()
    let s = Array(s.characters)
    let t = Array(t.characters)
    
    for i in 0..<s.count {
        if let pre = dict[s[i]] {
            if pre != t[i] { return false }
        } else {
            if dict.values.contains(t[i]) { return false }
            dict[s[i]] = t[i]
        }
    }
    return true
}


isIsomorphic("aa", "ab")
isIsomorphic("paper", "title")

