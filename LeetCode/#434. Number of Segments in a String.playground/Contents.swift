/* 2017. 10. 25
 
 Count the number of segments in a string, where a segment is defined to be a contiguous sequence of non-space characters.
 
 Please note that the string does not contain any non-printable characters.
 
 算出一個字串中有幾個段落，一個段落代表一段不含空白的連續字元。
 
 注意字串中不包含任何 "沒印出" 的字元
 
 
 Example:
 
 Input: "Hello, my name is John"
 Output: 5
 
 */


func countSegments(_ s: String) -> Int {
    return s.characters.split(separator: " ").count
}

countSegments("hello")
countSegments("")