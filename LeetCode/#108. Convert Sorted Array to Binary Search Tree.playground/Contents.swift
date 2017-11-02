/* 2017. 9. 20
 
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 給定一個升序陣列，把它轉換成高度平衡的二元搜尋樹。
 
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    if nums.count == 0 {
        return nil
    }
    
    let mid = nums[nums.count/2]
    
    var tree = TreeNode(mid)
    
    let leftnums = Array(nums[0..<nums.count/2])
    let rightnums = Array(nums[nums.count/2 + 1..<nums.count])
    
    tree.left = sortedArrayToBST(leftnums)
    tree.right = sortedArrayToBST(rightnums)
    
    return tree
}

sortedArrayToBST([1,2,3,4,5])


