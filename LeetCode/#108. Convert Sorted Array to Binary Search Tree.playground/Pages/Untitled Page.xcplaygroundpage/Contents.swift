/* 2017. 10. 21
 
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 給一二元樹，驗證它是否高度平衡。
 
 高度平衡的定義為，二元樹其兩個子樹的每個節點的深度不超過 1 。
 
 
 Example 1:
 
 Input:
        5
       / \
      3   4
     / \   \
    2   6   1
 
 Output: True
 
 該二元樹其兩個子樹的每個節點，深度差皆不超過 1 ，為高度平衡。
 
 
 Example 2:
 
 Input:
        5
       / \
      3   4
     / \   \
    2   6   1
           /
          7
 
 Output: False
 
 該二元樹倒節點 4 時，其左子樹為空，深度為 1，右子樹持續走到 7 ，深度為 3 ， 3 - 1 > 1 ，不為高度平衡。
 
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

let tree = TreeNode(5)
tree.left = TreeNode(3)
tree.right = TreeNode(4)
tree.left?.left = TreeNode(2)
tree.left?.right = TreeNode(6)
tree.right?.right = TreeNode(1)
tree.right?.right?.right = TreeNode(7)

func isBalanced(_ root: TreeNode?) -> Bool {
    
    func findDepth(_ root: TreeNode?) -> Int{
        if root == nil { return 0 }
        return max(findDepth(root!.left), findDepth(root!.right)) + 1
    }
    
    if root == nil { return true }
    let left = findDepth(root!.left)
    let right = findDepth(root!.right)
    
    return abs(left - right) <= 1 && isBalanced(root!.left) && isBalanced(root!.right)
}

isBalanced(tree)




