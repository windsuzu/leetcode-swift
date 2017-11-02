/* 2017. 8. 17
 
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 Note:
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 
 */


//func moveZeroes(_ nums: inout [Int]) {
//    
//    let count = nums.count
//    nums = nums.filter { $0 != 0 }
//    let newCount = nums.count
//    
//    for _ in 0..<count - newCount {
//        nums.append(0)
//    }
//}


func moveZeroes(_ nums: inout [Int]) {
    var j = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            let temp = nums[j]
            nums[j] = nums[i]
            nums[i] = temp
            j += 1
        }
    }
}


var nums = [0, 1, 0, 3, 12]
moveZeroes(&nums)



