/* 2017. 8. 7
 
 Given a word, you need to judge whether the usage of capitals in it is right or not.
 
 We define the usage of capitals in a word to be right when one of the following cases holds:
 
 1.All letters in this word are capitals, like "USA".
 2.All letters in this word are not capitals, like "leetcode".
 3.Only the first letter in this word is capital if it has more than one letter, like "Google".
 
 Otherwise, we define that this word doesn't use capitals in a right way.
 
 給一個單字，確認寫法是否正確。
 
 驗證規則:
 1. 所有單字都是大寫，像 "USA"
 2. 所有單字都非大寫，像 "leetcode"
 3. 除了第一個字大寫，其他皆為小寫，像 "Google"
 
 符合規則便輸出 true ，不符合便輸出 false。
 
 Example 1:
 Input: "USA"
 Output: True
 
 Example 2:
 Input: "FlaG"
 Output: False
 
 */


/* 第一次解題 : 32 ms
 
 算出字串中大寫數量，跑過三種判斷回傳是否正確。
 
 */

//func detectCapitalUse(_ word: String) -> Bool {
//    if word == "" { return false }
//    
//    var used = false
//    var cCount = 0
//    let firstCharacter = String(word.characters.first!)
//    
//    for c in word.characters {
//        cCount = String(c) == String(c).uppercased() ? cCount+1 : cCount+0
//    }
//    
//    if cCount == word.characters.count
//        || cCount == 0
//        || (cCount == 1 && firstCharacter == firstCharacter.uppercased()) {
//        used = true
//    }
//    return used
//}


/* Other Solution 1
 
 用 Swift 內建函式確認三種規則
 
 import Foundation
 
 func detectCapitalUse(_ word: String) -> Bool {
    return word == word.capitalized || word == word.uppercased() || word == word.lowercased()
}
 
 */


/* Other Solution 2 
 
 算出數量再來比較的簡化版。
 
 */

func detectCapitalUse(_ word: String) -> Bool {
    var cnt = 0
    for c in word.characters {
        if "Z" >= String(c) {
            cnt += 1
        }
    }
    return cnt == 0 || cnt == word.characters.count ||
        (cnt == 1 && "Z" >= word.characters.first!)
}




detectCapitalUse("USA")
detectCapitalUse("leetcode")
detectCapitalUse("Google")
detectCapitalUse("flaG")
detectCapitalUse("A")

