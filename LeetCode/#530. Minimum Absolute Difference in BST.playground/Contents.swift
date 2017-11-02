/* 2017. 8. 23
 
 Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.
 
 找出二元樹任意兩點，差距最小的值。
 
 Example:
 
 Input:
 
    1
     \
      3
     /
    2
 
 Output:
 1
 
 Explanation:
 The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).
 
 最小的差是 1 ，來自 2 和 1 (或 3 和 2)
 
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

// tree : [1,null,3,2]
var tree = TreeNode(1)
tree.right = TreeNode(3)
tree.right?.left = TreeNode(2)



func getMinimumDifference(_ root: TreeNode?) -> Int {
    var numbers = [Int]()
    var res = Int.max
    
    func inOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inOrder(root.left)
        
        if let last = numbers.last {
            res = min((root.val - last), res)
        }
        numbers.append(root.val)
        inOrder(root.right)
    }
    inOrder(root)
    return res
}


getMinimumDifference(tree)

