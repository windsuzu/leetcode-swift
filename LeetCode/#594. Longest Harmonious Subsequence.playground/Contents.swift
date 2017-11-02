/*
 
 We define a harmonious array is an array where the difference between its maximum value and its minimum value is exactly 1.
 
 Now, given an integer array, you need to find the length of its longest harmonious subsequence among all its possible subsequences.
 
 我們定義一個和諧陣列，該陣列的最大值及最小值只相差 1 。
 
 現在給你一個普通陣列，從該陣列的子序列去找出該陣列中最長的和諧陣列。
 
 Example 1:
 
 Input: [1,3,2,2,5,2,3,7]
 
 Output: 5
 
 Explanation: The longest harmonious subsequence is [3,2,2,2,3].
 
 從 Input 的陣列中，有一個子序列符合和諧陣列，就是 [3,2,2,2,3]
 
 Note: The length of the input array will not exceed 20,000.
 
 輸入的陣列長度不超過 20000 。
 
 
 */



/* Time Limit Exceeded
func findLHS(_ nums: [Int]) -> Int {
    var dict = [Int:Int]()
    var res = 0
    for num in nums {
        dict[num] = (dict[num] != nil) ? dict[num]! + 1 : 1
    }
    
    for key in dict.keys {
        if dict.keys.contains(key + 1) {
            res = max(res, dict[key]! + dict[key + 1]!)
        }
    }
    
    return res
}
  */



/* AC 815 MS
func findLHS(_ nums: [Int]) -> Int {
    var dict = [Int:Int]()
    var res = 0
    var last : (Int, Int)? = nil
    
    for num in nums {
        dict[num] = (dict[num] != nil) ? dict[num]! + 1 : 1
    }
    
    for (key, val) in dict.sorted(by: <) {
        if last != nil && last!.0 + 1 == key {
            res = max(res, val + last!.1)
        }
        last = (key, val)
    }
    return res
}
 */



/* ac 258 ms */
func findLHS(_ nums: [Int]) -> Int {
    var dict = [Int:Int]()
    for num in nums {
        dict[num] = (dict[num] != nil) ? dict[num]! + 1 : 1
    }
    
    var res = 0
    for (key, count) in dict {
        if let secondCount = dict[key + 1] {
            let temp = count + secondCount
            
            if temp > res {
                res = temp
            }
        }
    }
    
    return res
}

findLHS([1,4,2,2,5,2,4,7])

