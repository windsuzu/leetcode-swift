/* 2017. 9. 13 
 
 Given two arrays, write a function to compute their intersection.
 
 給定兩個陣列，求出他們的交集 (intersection)
 
 
 Example:
 Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
 
 [1, 2, 2, 1] 跟 [2, 2] 的交集為 [2, 2]
 
 
 Note:
 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 
 出現重複的元素也要返回。
 答案可以任意排列。
 
 */

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var nums1 = nums1.sorted()
    var nums2 = nums2.sorted()
    var res = [Int]()
    var i = 0, j = 0
    
    while i < nums1.count && j < nums2.count {
        if nums1[i] == nums2[j] {
            res.append(nums1[i])
            i += 1 ; j += 1
        } else if nums1[i] < nums2[j] {
            i += 1
        } else {
            j += 1
        }
    }
    
    return res
}

intersect([1,2,2,1], [2])