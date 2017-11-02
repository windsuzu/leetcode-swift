/* 2017. 10. 13
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 給定二元樹，驗證他是否對稱。
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
        1
       / \
      2   2
     / \ / \
    3  4 4  3
 
 
 But the following [1,2,2,null,3,null,3] is not:
 
        1
       / \
      2   2
       \   \
        3   3
 
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

let tree = TreeNode(1)
tree.left = TreeNode(2)
tree.right = TreeNode(2)
tree.left?.left = TreeNode(3)
tree.left?.right = TreeNode(4)
tree.right?.left = TreeNode(4)
tree.right?.right = TreeNode(3)

func isSymmetric(_ root: TreeNode?) -> Bool {
    var res = true
    
    func checking(_ left: TreeNode?, _ right: TreeNode?) {
        if left == nil && right != nil { res = false; return }
        if left != nil && right == nil { res = false; return }
        if left == nil && right == nil { return }
        if left != nil && right != nil {
            if left!.val != right!.val {
                res = false
                return
            } else {
                checking(left?.left, right?.right)
                checking(left?.right, right?.left)
            }
        }
    }
    checking(root?.left, root?.right)
    return res
}


isSymmetric(tree)