/* 2017. 11. 7
 
 Given a binary tree, find its minimum depth.
 
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 
 給定二元樹，找出最小深度。
 
 最小深度代表由根節點至某個最近的葉節點所畫出的最短路徑。
 
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
tree.right?.left = TreeNode(6)
tree.left?.left?.left = TreeNode(7)



func minDepth(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    var res = Int.max
    func dig(_ root: TreeNode?, _ depth: Int) {
        guard let root = root else { return }
        var depth = depth
        depth += 1
        if root.left == nil && root.right == nil {
            res = min(depth, res)
        }
        dig(root.left, depth)
        dig(root.right, depth)
    }
    
    dig(root, 0)
    return res
}


minDepth(tree)


