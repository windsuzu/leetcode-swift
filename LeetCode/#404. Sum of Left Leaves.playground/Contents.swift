/* 2017. 8. 29
 
 Find the sum of all left leaves in a given binary tree.
 
 算出所有左節點的加總。
 
 Example:
 
        3
       / \
      9  20
        /  \
       15   7
 
 There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
 
 這個二元樹有兩個左節點，分別為 9 和 15 ，加總為 24 。
 
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


// tree : [3,9,20,2,12,15,7]

var tree = TreeNode(3)
tree.left = TreeNode(9)
tree.right = TreeNode(20)
tree.left?.left = TreeNode(2)
tree.left?.right = TreeNode(12)
tree.right?.left = TreeNode(15)
tree.right?.right = TreeNode(7)



func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    var res = 0
    
    if root?.left != nil {
        if root?.left?.left == nil && root?.left?.right == nil {
            res += (root?.left?.val)!
        } else {
            res += sumOfLeftLeaves(root?.left)
        }
    }
    res += sumOfLeftLeaves(root?.right)
    return res
}

sumOfLeftLeaves(tree)







