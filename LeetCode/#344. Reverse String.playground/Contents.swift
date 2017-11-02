/* 2017. 8. 2
 
 Write a function that takes a string as input and returns the string reversed.
 
 Example:
 Given s = "hello", return "olleh".
 
 寫個函式將字串反轉過來。
 輸入: "hello"
 輸出: "olleh"
 
 */


/* 第一次解題 : 229 ms 
 
 純粹使用 swift 內建的 reversed 函式。 沒動腦還贏 50% ㄎㄎ
 
 */

//func reverseString(_ s: String) -> String {
//    return String(s.characters.reversed())
//}



/* Other Solution 1 
 
 使用迴圈不斷首尾對調對調。
 
 */

//func reverseString(_ s: String) -> String {
//    var stringArray = Array(s.characters)
//    var i = 0
//    var j = s.characters.count - 1
//    
//    while i < j {
//        let temp = stringArray[i]
//        stringArray[i] = stringArray[j]
//        stringArray[j] = temp
//        i+=1
//        j-=1
//    }
//    
//    return String(stringArray)
//}



/* Other Solution 2 
 
 從字串的最後一個字元，一直往前加入到新的字串中。
 
 */

func reverseString(_ s: String) -> String {
    var index = s.endIndex
    var result = ""
    
    while index != s.startIndex {
        index = s.index(before: index)
        result.append(s[index])
    }
    return result
}

reverseString("hello")

