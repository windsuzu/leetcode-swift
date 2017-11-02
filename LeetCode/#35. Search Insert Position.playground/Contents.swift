/* 2017. 10. 6
 
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 給定排序過陣列和一個目標值，找出該目標值位於陣列的索引值。所以沒有該數，回傳該數應該被插入在什麼位置。
 
 陣列中沒有重複的數字。
 
 Here are few examples.
 
 [1,3,5,6], 5 → 2
 陣列中 5 的索引為 2
 
 [1,3,5,6], 2 → 1
 陣列中沒有 2 ，應該在位置 1 插入
 
 [1,3,5,6], 7 → 4
 陣列中沒有 7 ，應該在位置 4 插入
 
 [1,3,5,6], 0 → 0
 陣列中沒有 0 ，應該在位置 0 插入
 
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var low = 0, high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target { return mid }
        else if nums[mid] > target { high = mid - 1 }
        else { low = mid + 1 }
    }
    return low
}



//searchInsert([1,3,5,6], 0)
searchInsert([1,3,5,6], 3)




