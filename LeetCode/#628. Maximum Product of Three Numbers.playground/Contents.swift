/* 2017. 9. 10
 
 Given an integer array, find three numbers whose product is maximum and output the maximum product.
 
 給一個整數陣列，找出三個數字他們相乘會是最大的數字。
 
 
 Note:
 1. The length of the given array will be in range [3,10^4] and all elements are in the range [-1000, 1000].
 2. Multiplication of any three numbers in the input won't exceed the range of 32-bit signed integer.
 
 整數陣列的範圍為 [3, 10^4] ，然後所有元素的值的範圍為 [-1000, 1000] 。
 算出來的乘積答案不會超過 32 位元正負號整數。
 
 Example 1:
 
 Input: [1,2,3]
 
 Output: 6
 
 剛好陣列只有三個數字，最大乘積即是 6 。
 
 
 Example 2:
 
 Input: [1,2,3,4]
 
 Output: 24
 
 陣列中最大的乘積是 2 * 3 * 4 = 24
 
 */



/* 解題 */
func maximumProduct(_ nums: [Int]) -> Int {
    let nums = nums.sorted(by: >)
    return max(nums[0] * nums[1] * nums[2],
               nums[0] * nums[nums.count - 1] * nums[nums.count - 2])
}



maximumProduct([1,2,3,4,5])
maximumProduct([-1000,-500,3,4,5])




