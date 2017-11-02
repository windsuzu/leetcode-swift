/* 2017. 9. 5
 
 Given two strings s and t, write a function to determine if t is an anagram of s.
 
 有兩個字串 s 跟 t ，寫個函式來驗證 t 是否為 s 重新建構出來的字串。
 
 For example,
 s = "anagram", t = "nagaram", return true.
 s = "rat", t = "car", return false.
 
 "nagaram" 是從 anagram 重構出來的所以回傳 true 。
 "rat" 不是從 car 重構的所以回傳 false 。
 
 */


/* Bit Manipulation not work for "ac" & "bb"
 
func isAnagram(_ s: String, _ t: String) -> Bool {
    var sSum = 0
    for c in s.utf8 {
        sSum += Int(c)
    }
    for c in t.utf8 {
        sSum -= Int(c)
    }
    return sSum == 0
}
  */



func isAnagram(_ s: String, _ t: String) -> Bool {
    var alphabet = [Int](repeating: 0, count: 26)
    for c in s.utf8 { alphabet[Int(c) - 97] += 1 }
    for c in t.utf8 { alphabet[Int(c) - 97] -= 1 }
    for i in alphabet { if i != 0 { return false } }
    return true
}

isAnagram("rat", "tar")
isAnagram("ac", "bb")
isAnagram("a", "ab")


