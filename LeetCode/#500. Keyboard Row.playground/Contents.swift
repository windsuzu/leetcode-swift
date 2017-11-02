/* 2017. 7. 29
 
 Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
 
 給一串單詞陣列，從每一個單詞篩選出單詞全部的字母都位在鍵盤上同一行。
 
 [QWERTYUIOP, ASDFGHJKL, ZXCVBNM]
 
 Example 1:
 Input: ["Hello", "Alaska", "Dad", "Peace"]
 Output: ["Alaska", "Dad"]
 
 例如 Alaska 與 Dad 都位在 ASDFGHJKL 這行，所以就挑出來。
 
 
 Note:
 You may use one character in the keyboard more than once.
 You may assume the input string will only contain letters of alphabet.
 
 假定每個字元都會用到一次以上。
 假定每個輸入的東西都是 a-z 字母。
 
 */


// 第一次解題 : Accepted


import Foundation

func findWords(_ words: [String]) -> [String] {
    
    let rules =  ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
    var result = words
    
    words.forEach { word in
        // If the word not in the rules and filter it
        if (checkWords(word: word.uppercased())) {
            result = result.filter { $0 != word }
        }
    }
    
    
    // check if the word's characters are all in one keyboard row
    func checkWords(word: String) -> Bool {
        
        // Use first character to find which row the word would be in
        
        let rule = rules.filter { $0.range(of: String(word.characters.first!)) != nil }
        
        
        // If any character of the word not contain in the rule -> return true
        for c in word.characters {
            if (rule.first!.range(of: String(c))) == nil {
                return true
            }
        }
        
        return false
    }
    
    return result
}



findWords(["Hello","Alaska","Dad","Peace"])