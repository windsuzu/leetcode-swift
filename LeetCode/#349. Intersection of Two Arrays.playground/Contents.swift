/* 2017. 8. 21
 
 Given two arrays, write a function to compute their intersection.
 
 算出兩個陣列的 INTERSECT 。
 
 Example:
 Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
 
 */


/* 解題
 
 func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
 
    let set1 = Set(nums1)
    let set2 = Set(nums2)
    var temp = Set<Int>()
    var res = [Int]()
 
    for i in set1 {
        temp.insert(i)
    }
 
    for j in set2 {
        if !temp.insert(j).inserted {
    res.append(j)
        }
    }
    return res
 }
 
 */


/* 簡潔 */

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let values = Set(nums1)
    var result = Set<Int>()
    for num in nums2 {
        if values.contains(num) {
            result.insert(num)
        }
    }
    return Array(result)
}



intersection([1,23,4,2,23,4,234,23,42,34,3,43], [1,2,4,2,24,3,423,432,324,234])
