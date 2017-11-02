/* 2017. 7. 22
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 丟進一個整數陣列和一個目標值， 並且回傳一個整數陣列， 其中包含兩個數， 這兩個數的總和應該等於目標值
 
 必須保證每一次輸入的數字都能夠有一個正確的答案， 並且不會重複使用同一個(元素 (第一次看成數字 X_X))
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1]
 
 */


// 第一次提交 : Time Limit Exceeded

//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//
//    var dict = [Int: Int]()
//    for (index, element) in nums.enumerated() {
//        dict[index] = element
//    }
//
//    for (key, value) in dict.sorted(by: <) {
//        for (key2, value2) in dict where key != key2 {
//
//            if value + value2 == target {
//                return [key, key2]
//            }
//        }
//    }
//    return [0]
//}

// 第二次提交 : Time Limit Exceeded

//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//
//    for i in stride(from: 0, to: nums.count, by: 1) {
//        for j in stride(from: i+1, to: nums.count, by: 1) {
//            if nums[j] == target - nums[i] {
//                return [i,j]
//            }
//        }
//    }
//    return [0]
//}



// 第三次提交 : Time Limit Exceeded
//
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//
//    var dict = [Int: Int]()
//    for (index, element) in nums.enumerated()  {
//
//        let complement = target - element
//
//        if dict.values.contains(complement) {
//            return [nums.index(of: complement)!, index]
//        }
//
//        dict[index] = element
//    }
//
//    return [0]
//}


// 第四次提交 : Accepted
// 參考 https://github.com/raywenderlich/swift-algorithm-club/tree/master/Two-Sum%20Problem

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dict = [Int: Int]()
    
    for i in 0..<nums.count {
        if let target = dict[nums[i]] {
            return [target, i]
        } else {
            dict[target - nums[i]] = i
        }
    }
    
    return [0]
}



twoSum([ 7, 2, 23, 8, -1, 0, 11, 6  ], 10)



