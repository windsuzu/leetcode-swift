/* 2017. 9. 7 
 
 Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 
 給一組整數陣列，找出陣列是否包含重複的數字。
 
 如果有重複，則回傳 true ，如果每一個整數都只出現一次，回傳 false 。
 
 */



/* 解題 */

func containsDuplicate(_ nums: [Int]) -> Bool {
    return Set(nums).count != nums.count
}


containsDuplicate([1,2,3,3])