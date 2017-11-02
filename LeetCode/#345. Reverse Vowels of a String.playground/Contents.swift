/* 2017. 10. 17
 
 Write a function that takes a string as input and reverse only the vowels of a string.
 
 反轉字串，但只反轉母音的部分。
 
 Example 1:
 Given s = "hello", return "holle".
 
 hello 中的 eo 轉換為 oe
 
 Example 2:
 Given s = "leetcode", return "leotcede".
 
 leetcode 中的 eeoe 轉換為 eoee
 
 */

func reverseVowels(_ s: String) -> String {
    let set: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    var s = Array(s.characters)
    var left = 0
    var right = s.count - 1
    while left < right {
        while left < right && !set.contains(s[left]) {
            left += 1
        }
        while left < right && !set.contains(s[right]) {
            right -= 1
        }
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        left += 1
        right -= 1
    }
    return String(s)
}



reverseVowels("apple")
reverseVowels("hello")
reverseVowels("leetcode")



