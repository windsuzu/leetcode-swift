/* 2017. 10. 20
 
 Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.
 
 給定一個不為空的字串，且字元皆為小寫英文字母，字串長度不超過 10000 。
 驗證該字串，是否為字串中某子字串複製組合而成。
 
 
 Example 1:
 Input: "abab"
 Output: True
 
 Explanation: It's the substring "ab" twice.
 
 abab 是被 ab 子字串複製組合而成

 
 Example 2:
 Input: "aba"
 Output: False
 
 aba 不為任何子字串的重複
 
 
 Example 3:
 Input: "abcabcabcabc"
 Output: True
 
 Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
 
 abcabcabcabc 為 abc 重組四次， abcabc 重組兩次而成
 
 */

import Foundation
func repeatedSubstringPattern(_ s: String) -> Bool {
    let ss = s + s
    let _ss_ = ss.substring(with: ss.index(after: ss.startIndex)..<ss.index(before: ss.endIndex))
    return _ss_.contains(s)
}


repeatedSubstringPattern("a")