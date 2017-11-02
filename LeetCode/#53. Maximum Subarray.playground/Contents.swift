/* 2017. 10. 7
 
 Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
 
 找出陣列中，擁有最大值的子陣列，子陣列的值必須是連續且至少有一個值的。
 
 
 For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
 
 the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 
 在陣列 [-2,1,-3,4,-1,2,1,-5,4] 中， [4,-1,2,1] 可以得到最大加總值 6 。
 
 */

func maxSubArray(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var temp = nums[0], end = nums[0]
    for i in 1..<nums.count {
        temp = max(temp + nums[i], nums[i])
        end = max(temp, end)
    }
    return end
}


maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
