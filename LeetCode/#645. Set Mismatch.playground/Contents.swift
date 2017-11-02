/* 2017. 9. 30
 
 The set S originally contains numbers from 1 to n. But unfortunately, due to the data error, one of the numbers in the set got duplicated to another number in the set, which results in repetition of one number and loss of another number.
 
 一組 Set 包含整數 1 到 n ，但發生了資料錯誤，有一個整數被重複印出兩次且取代某另一個整數，所以整組 Set 中包含一個已重複的整數和一個消失的整數。
 
 Given an array nums representing the data status of this set after the error. Your task is to firstly find the number occurs twice and then find the number that is missing. Return them in the form of an array.
 
 給一個陣列代表已經發生錯誤的 Set ，你的工作是先找出出現兩次的數，然後再找出消失的數。回傳這兩個數。
 
 
 Example 1:
 Input: nums = [1,2,2,4]
 Output: [2,3]
 
 2 被重複印出兩次， 3 是消失的那一個數字，所以回傳 [2, 3] 。
 
 Note:
 The given array size will in the range [2, 10000].
 The given array's numbers won't have any order.
 
 陣列長度介於 [2, 10000]
 給予的陣列不會有任何排列。
 
 */

func findErrorNums(_ nums: [Int]) -> [Int] {
    var dict = [Int: Int]()
    var res = [Int]()
    var sum = Array(1...nums.count).reduce(0, {$0 + $1})
    
    for num in nums {
        dict[num] = dict[num] != nil ? dict[num]! + 1 : 1
        if dict[num]! > 1{
            res.append(num)
        } else {
            sum -= num
        }
    }
    res.append(sum)
    return res
}


findErrorNums([3,2,3,4,6,5])
findErrorNums([1,2,4,5,6,7,6])
findErrorNums([1,2,4,4])

