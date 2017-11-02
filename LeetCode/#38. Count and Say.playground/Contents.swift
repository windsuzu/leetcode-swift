/* 2017. 10. 30
 
 The count-and-say sequence is the sequence of integers with the first five terms as following:
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 
 1 is read off as "one 1" or 11.
 11 is read off as "two 1s" or 21.
 21 is read off as "one 2, then one 1" or 1211.

 Given an integer n, generate the nth term of the count-and-say sequence.
 
 Note: Each term of the sequence of integers will be represented as a string.
 
 "數和說"序列的前五種規則如下所示 :
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 
 1 是 1 ， 因為 1 個 1 所以下一個
 2 是 11 ， 因為 2 個 1 所以下一個
 3 是 21 ， 因為 1 個 2 ， 1 個 1 ，所以下一個
 4 是 1211
 
 按照這個順序下去，算出第 n 個的時候 ，他的"數和說"會是多少。
 
 
 Example 1:
 Input: 1
 Output: "1"
 
 
 Example 2:
 Input: 4
 Output: "1211"
 
 返回的值為字串。
 
 */

func countAndSay(_ n: Int) -> String {
    var res = "1"
    if n <= 1 { return res }
    
    for _ in 2...n {
        res = convertNext(res)
    }
    return res
}

func convertNext(_ last: String) -> String {
    let arr = Array(last.characters)
    var count = 0
    var temp = ""
    var new = ""
    print(arr)
    var i = 0
    while i != arr.count {
        
        if temp != String(arr[i]) {
            new += count == 0 ? "" : String(count) + temp
            temp = String(arr[i])
            count = 1
        } else {
            count += 1
        }
        i += 1
    }
    
    new += String(count) + temp
    print(new)
    return new
}

countAndSay(10)
