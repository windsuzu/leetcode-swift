/* 2017. 9. 9
 
 Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.
 
 This is case sensitive, for example "Aa" is not considered a palindrome here.
 
 給一個字串包含大小寫文字，找出裡面文字能拼成最長的回文有多長。
 
 請注意大小寫的區別， "Aa" 不包含在回文裡面。
 
 Example:
 
 Input:
 "abccccdd"
 
 Output:
 7
 
 Explanation:
 One longest palindrome that can be built is "dccaccd", whose length is 7.
 
 "abccccdd" 最長的回文可以拼成 "dccaccd"，長度為 7 。
 
 */

/* 解題 */

func longestPalindrome(_ s: String) -> Int {
    var dict = [Character : Int]()
    var res = 0
    
    for c in s.characters {
        if var i = dict[c] {
            i += 1
            if i == 2 {
                res += 2
                i = 0
            }
            dict[c] = i
        } else {
            dict[c] = 1
        }
    }
    
    if dict.contains(where: {$0.1 > 0 }) {
        res += 1
    }
    
    return res
}



longestPalindrome("")
longestPalindrome("a")
longestPalindrome("aA")
longestPalindrome("abbcccc")
longestPalindrome("abccccdd")
longestPalindrome("cccaaabdbdbd")
longestPalindrome("uapneruginaeorigbnaueirnvaueirjnuoebvhkbzxcjbvkhzjxbcvhjkzbxchjvbyfhayirfaheuiyrfhjskdalfhjklhzxcvarjgu")






