/* 2017. 10. 31
 
 Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 給一個已排序陣列，移除那些重複的元素，讓每個元素只出現一次，並且返回移除後陣列的新長度。
 
 不使用額外空間，使用已使用的固定記憶體。
 
 For example,
 Given input array nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
 
 [1,1,2] 應該要返回 2 ，因為 1 重複了兩次。移除後應為 [1,2] 長度為 2 。
 
 */


func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count < 2 { return nums.count }
    var count = 1
    
    for i in 1..<nums.count {
        if nums[i - 1] != nums[i] {
            nums[count] = nums[i]
            count += 1
        }
    }
    return count
}



var array = [1,1,2,4,5,6,6,6]
removeDuplicates(&array)



