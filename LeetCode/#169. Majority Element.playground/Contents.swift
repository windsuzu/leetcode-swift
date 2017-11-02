/* 2017. 9. 1
 
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 
 從陣列中找出出現次數超過一半次數的元素。
 
 可以假設陣列不為空，且一定有一個超過次數元素存在。
 
 */

func majorityElement(_ nums: [Int]) -> Int {
    var count = 1
    var res = nums[0]
    
    for i in 1..<nums.count {
        if count == 0 {
            count += 1
            res = nums[i]
        } else if res == nums[i] {
            count += 1
        } else {
            count -= 1
        }
        
    }
    return res
}



majorityElement([1])
majorityElement([6,5,5])
majorityElement([4,3,3,3,4])




