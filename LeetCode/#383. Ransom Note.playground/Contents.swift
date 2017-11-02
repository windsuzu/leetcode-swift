/* 2017. 8. 24
 
 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
 
 Each letter in the magazine string can only be used once in your ransom note.
 
 給予 A 字串與 B 字串， 若 A 字串的每一個字皆由 B 字串取得而來，回傳 true 。
 每個字元從 B 只能取得一次，每個字元皆是獨一無二的。
 
 
 Note:
 You may assume that both strings contain only lowercase letters.
 
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 
 可以從 B 字串（aab） 可以拿到 （aa） 組成 A 字串，所以回傳 true 。
 
 */


/* 解題 效率差
 
 func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
 
    var b = Array(magazine.characters)
    var a = Array(ransomNote.characters)
 
    for i in 0..<a.count {
        if b.contains(a[i]) {
            let index = b.index(of: a[i]) ?? 0
            b.remove(at: index)
        }
    }
 
    if b.count == magazine.characters.count - a.count {
        return true
    }
 
    return false
 }
 
 */


import Foundation

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var a = ransomNote
    var b = magazine
    
    for c in ransomNote.characters {
        if b.contains("\(c)") {
            b.remove(at: (b.range(of: "\(c)")?.lowerBound)!)
            a.remove(at: (a.range(of: "\(c)")?.lowerBound)!)
        }
    }
    
    return a == "" ? true : false
}


canConstruct("f*ck", "* pickedoffatthirdbase")











