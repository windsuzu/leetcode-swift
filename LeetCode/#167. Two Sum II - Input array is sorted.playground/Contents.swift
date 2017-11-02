/* 2017. 8. 28
 
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 
 
 給予已經升序的數字陣列，找出兩個數字相加符合目標值。
 
 最後須返回找到的值的索引，且 index1 小於 index2 。
 
 假設一定會有一個正確解，而且沒有使用相同元素兩次。
 
 Input: numbers={2, 7, 11, 15}, target=9
 Output: index1=1, index2=2
 
 目標值為 9 ，找到 2 + 7 = 9 ， 返回 2 -> index = 1 ， 7 -> index = 2 。
 
 */



/* BAD EFFICIENCY
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var res = [Int]()
    
    for i in 0..<numbers.count {
        let com = target - numbers[i]
        var i = i + 1
        for j in i..<numbers.count where numbers[j] == com {
            res = [i, j+1]
            break
        }
        if !res.isEmpty { break }
    }
    return res
}
 */



/* Binary Search */
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    
    while left < right {
        if numbers[left] + numbers[right] == target {
            return [left + 1, right + 1]
        } else if numbers[left] + numbers[right] < target {
            left += 1
        } else {
            right -= 1
        }
    }
    return [0,0]
}

twoSum([2, 7, 11, 15], 26)
twoSum([1,2,3,3,4,4,5,5,6,7,8,9,11,23,45,67,87,98,99], 7)








