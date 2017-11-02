/* 2017. 8. 2
 
 Write a program that outputs the string representation of numbers from 1 to n.
 
 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
 
 
 寫一個函式， 從 1 數到指定的數字， 遇到 3 就喊 Fizz ， 遇到 5 就喊 Buzz ， 那遇到 15 ..
 1! , 2! , Fizz! , 4! , Buzz! ... 13! , 14 , FizzBuzz!
 
 Example:
 
 n = 15,
 
 Return:
 [
 "1",
 "2",
 "Fizz",
 "4",
 "Buzz",
 "Fizz",
 "7",
 "8",
 "Fizz",
 "Buzz",
 "11",
 "Fizz",
 "13",
 "14",
 "FizzBuzz"
 ]
 
 */


/* 第一次解題 : 32 ms 
 
 因為 3 跟 5 相乘的數遇到時因為以 15 作為最優先判斷，所以 i%15 == 0 擺在第一個
 
 */

//func fizzBuzz(_ n: Int) -> [String] {
//    var array = [String]()
//    
//    for i in 1...n {
//        if i%15 == 0 {
//            array.append("FizzBuzz")
//        } else if i%5 == 0 {
//            array.append("Buzz")
//        } else if i%3 == 0 {
//            array.append("Fizz")
//        } else {
//            array.append(String(i))
//        }
//    }
//    
//    return array
//}


/* 更快速解法 : 4 ms
 
 雖然看起來更不容易讀，但因為沒有使用到 % 的運算，所以執行速度快了一些
 每次迴圈各對 fizz 跟 buzz + 1
 遇到判斷就轉成字串放到 array 中，把 fizz 或 buzz 歸零
 
 */

func fizzBuzz(_ n: Int) -> [String] {
    var array = [String]()
    
    var fizz = 0, buzz = 0
    
    for i in 1...n {
        fizz+=1
        buzz+=1
        
        if fizz == 3 && buzz == 5 {
            array.append("FizzBuzz")
            fizz = 0
            buzz = 0
        } else if fizz == 3 {
            array.append("Fizz")
            fizz = 0
        } else if buzz == 5 {
            array.append("Buzz")
            buzz = 0
        } else {
            array.append("\(i)")
        }
    }
    
    return array
}




fizzBuzz(15)