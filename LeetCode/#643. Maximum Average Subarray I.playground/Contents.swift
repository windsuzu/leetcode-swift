/* 2017. 10. 22
 
 Given an array consisting of n integers, find the contiguous subarray of given length k that has the maximum average value. And you need to output the maximum average value.
 
 給一個由 n 個整數組成的陣列，並且給定目標值 k 。找出陣列中連續 k 個值其平均為陣列中最大平均值，並且返回該平均值。
 
 Example 1:
 
 Input: [1,12,-5,-6,50,3], k = 4
 Output: 12.75
 
 Explanation: Maximum average is (12-5-6+50)/4 = 51/4 = 12.75

 在 [1,12,-5,-6,50,3] 陣列中，要找出連續 4 個數的平均為最大平均值。
 答案為 [12,-5,-6,50] 這段， (12-5-6+50)/4 = 51/4 = 12.75
 
 */


/* Time Limit Exceeded 
 
func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var temp = Array(nums[0..<k])
    var res = Double(temp.reduce(0, { $0 + $1 })) / Double(k)
    
    for i in k..<nums.count {
        temp.removeFirst()
        temp.append(nums[i])
        res = max(res,  Double(temp.reduce(0, { $0 + $1 })) / Double(k))
    }
    
    return res
}
*/


func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var temp = nums[0..<k].reduce(0, {$0 + $1})
    var res = temp
    
    for i in k..<nums.count {
        temp += nums[i] - nums[i-k]
        res = max(res, temp)
    }
    
    return Double(res) / Double(k)
}



findMaxAverage([1,12,-5,-6,50,3], 4)