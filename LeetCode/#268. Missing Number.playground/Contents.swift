/* 2017. 9. 15
 
 Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 
 給定 n 個不同的數字，從 0, 1, 2, ... , n ， 找出其中消失的數字。
 
 
 For example,
 Given nums = [0, 1, 3] return 2.
 
 [0, 1, 3] 當中發現 2 消失了。
 
 */


/* SUM SOLUTION */
 
func missingNumber(_ nums: [Int]) -> Int {
    var sum = nums.count
    for i in 0..<nums.count {
        sum += i
        sum -= nums[i]
    }
    return sum
}
 





/* XOR SOLUTION

func missingNumber(_ nums: [Int]) -> Int {
    var res = nums.count
    for i in 0..<nums.count {
        res ^= i
        res ^= nums[i]
    }
    return res
}
 */



missingNumber([1, 3, 5, 0, 2, 4, 6, 7, 9])




