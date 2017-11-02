/* 2017. 9. 16
 
 Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
 
 給定二元樹，計算出樹的直徑為多少。 
 
 二元樹當中任意兩點的路徑若為最長，就代表該樹的直徑。
 
 這條直徑有可能會經過根節點，有可能不會。
 
 
 Example:
 
 Given a binary tree
        1
       / \
      2   3
     / \
    4   5
 
 Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
 
 直徑為 3 ，因為最長路徑為 [4,2,1,3] 或 [5,2,1,3] 。
 
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
tree.right = TreeNode(3)
tree.left?.left = TreeNode(4)
tree.left?.right = TreeNode(5)
tree.left?.left?.left = TreeNode(6)
tree.left?.right?.right = TreeNode(7)
tree.left?.left?.left?.left = TreeNode(8)
tree.left?.left?.left?.right = TreeNode(10)
tree.left?.left?.left?.right?.right = TreeNode(11)
tree.left?.right?.right?.right = TreeNode(9)

/*
 
            1
           / \
          2   3
         / \
        4   5
       /     \
      6       7
     / \       \
    8   10      9
         \
         11
 */


func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var res = 0
    var depth = 0
    
    func getDepth(root : TreeNode?) -> Int {
        if root == nil { return 0 }
        
        let left = getDepth(root: root?.left)
        let right = getDepth(root: root?.right)
        
        depth = max(depth, left + right)
        
        return max(left , right) + 1
    }
    
    getDepth(root: root)
    return depth
}

diameterOfBinaryTree(tree)





