/* 2017. 11. 8
 
 Given a pattern and a string str, find if str follows the same pattern.
 
 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.
 
 給定一個字串格式 pattern 和字串 str ，驗證 str 是否符合 pattern 的格式。
 
 Notes:
 You may assume pattern contains only lowercase letters, and str contains lowercase letters separated by a single space.
 
 pattern 字串只包含小寫字母， str 字串包含小寫字母，和用空白分隔段落。
 
 Examples:
 pattern = "abba", str = "dog cat cat dog" should return true.
 pattern = "abba", str = "dog cat cat fish" should return false.
 pattern = "aaaa", str = "dog cat cat dog" should return false.
 pattern = "abba", str = "dog dog dog dog" should return false.
 
 "dog cat cat dog" 符合 "abba" 的格式，返回 true
 "dog cat cat fish" 不符合 "abba" 的格式 ，應為 "abbc" ，返回 false
 "dog cat cat dog" 不符合 "aaaa" 的格式，應為 "abba" ，返回 false
 "dog dog dog dog" 不符合 "abba" 的格式，應為 "aaaa" ，返回 false
 
 */

func wordPattern(_ pattern: String, _ str: String) -> Bool {
    if pattern.isEmpty && str.isEmpty { return false }
    let p = Array(pattern)
    let s = str.split(separator: " ")
    var dict = [String : String]()
    if p.count != s.count { return false }
    var i = 0
    while i != p.count {
        if let pre = dict[String(p[i])] {
            if pre != String(s[i]) { return false }
        } else {
            if dict.values.contains(String(s[i])) { return false }
            dict[String(p[i])] = String(s[i])
        }
        i += 1
    }
    return true
}

wordPattern("abba", "dog dog dog dog")
wordPattern("aaaa", "dog cat cat fish")
wordPattern("aaaa", "dog dog dog dog")
wordPattern("abba", "dog cat cat fish")
wordPattern("caad", "dog cat cat fish")
wordPattern("a", "dog")
wordPattern("a", "abc aaa")
wordPattern("", "")



