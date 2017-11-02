/* 2017. 8. 5 
 
 Given a binary array, find the maximum number of consecutive 1s in this array.
 
 給一個二進位陣列，找出連續出現最多次 1 的次數。
 
 Example 1:
 
 Input: [1,1,0,1,1,1]
 Output: 3
 
 Explanation: The first two digits or the last three digits are consecutive 1s.
 The maximum number of consecutive 1s is 3.
 
 前面兩個數字跟最後三個數字都是連續的 1 。 最長的是後面的 3 次。
 
 
 Note:
 The input array will only contain 0 and 1.
 The length of input array is a positive integer and will not exceed 10,000
 
 array 裡面只有 0 or 1 。 array 的長度不會超過 10,000 。
 
 */


/* 第一次解題 : 69 ms 
 
 定義一個 counter 計算累積了幾次重複的 1
 遇到 0 時就把 counter 歸零，放到 result 中
 如果 counter > result 就將 result 更新
 
 */


//func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
//    var result = 0
//    var counter = 0
//    
//    for num in nums {
//        counter += num == 1 ? num : 0
//        counter = num == 0 ? 0: counter
//        result = counter < result ? result : counter
//    }
//    return result
//}




/* One Line Solution
 
 我還以為我的算法很簡潔了，還有更厲害的。
 將陣列透過 0 切成不同的 1s 陣列，用 reduce 的方式不斷比較出最高次數的陣列。
 
 */

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    return nums.split(separator: 0).reduce(0){ max($0, $1.count)}
}


findMaxConsecutiveOnes([1,1,1,0,1,1,1,1,0,1,1,1,1,1])
findMaxConsecutiveOnes([1,1,1,1,1,1,1,0])




