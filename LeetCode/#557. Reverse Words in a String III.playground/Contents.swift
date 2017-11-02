/* 2017. 7. 30
 
 Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
 
 給一個字串，將字串中每個單詞反轉過來，組合成一個新的字串。
 但單詞順序還是跟原本一樣，空白位置也一樣。
 
 Example 1:
 Input: "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 
 
 Note: In the string, each word is separated by single space and there will not be any extra space in the string.
 
 在字串中，每個單詞都被單個空白給區隔開來，也不會有多的空白在字串中。
 
 */

import Foundation


/* 第一次解題 : Accepted
 
 先將字串依 space 拆成 Array
 對每個字做 String.characters.reversed()
 
 取得反轉過的字串後， append 到答案的字串中，並且加上一個空白。
 最後返回時，把最後一個空白清掉。
 
 */

//func reverseWords(_ s: String) -> String {
//    
//    let split = s.components(separatedBy: " ")
//    var reversedWords = ""
//    for s in split {
//        reversedWords.append(String(s.characters.reversed()))
//        reversedWords.append(" ")
//    }
//    
//    return reversedWords.substring(to: reversedWords.index(before: reversedWords.endIndex))
//}



/* Best Solution 
 
 一樣 String 拆成 Array ，對每個拆好的 String 進行自訂的 reverse 函式。
 reverse 過的字串 append 到 result 中，並且判斷迴圈還沒到最後一個的都要加一個空白。
 
 */

func reverseWords(_ s: String) -> String {
    
    var stringArray =  s.components(separatedBy: " ")
    var result = ""
    for i in 0..<stringArray.count {
        result += reverseWord(stringArray[i])
        if i != stringArray.count - 1  {
            result += " "
        }
    }
    return result
    
}

/* 自製 reverse 函式 :
    
 將字串換成 array : Let's -> Array(Let's)
 
  0 < 4 {
    temp = Array[0] -> "L"
    
    Array[0] = Array[4] -> Array(set's)
    Array[4] = temp -> Array(set'L)
    
    i = 1
    j = 3
 }
 
 1 < 3 {
    temp = Array[1] -> "e"
 
    Array[1] = Array[3] -> Array(s't's)
    Array[3] = temp -> Array(s'teL)
 
    i = 2
    j = 2
 }
 
 */

func reverseWord(_ s: String) -> String {
    var arrayOfString = Array(s.characters)
    var i = 0
    var j = arrayOfString.count - 1
    
    while (i < j) {
        let temp = arrayOfString[i]
        arrayOfString[i] = arrayOfString[j]
        arrayOfString[j] = temp
        i += 1
        j -= 1
    }
    return String(arrayOfString)
}


reverseWords("Let's take LeetCode contest")

