/* 2017. 10. 12
 
 Given a binary tree, return all root-to-leaf paths.
 
 給一個二元樹，返回所有根節點到葉節點的路徑。
 
 
 
 For example, given the following binary tree:
 
        1
      /   \
     2     3
      \
       5
 
 All root-to-leaf paths are:
 
 ["1->2->5", "1->3"]
 
 根據上圖，總共有兩個根節點到葉節點的路徑，分別為 "1" -> "2" -> "5" 以及 "1" -> "3"。
 
 */

/* Definition for a binary tree node. */
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




func binaryTreePaths(_ root: TreeNode?) -> [String] {
    if root == nil { return [] }
    var res = [String]()
    search(root, "", &res)
    return res
}

func search(_ root: TreeNode?, _ currentPath: String, _ res: inout [String]) {
    if root?.left == nil && root?.right == nil { res.append("\(currentPath)\(root!.val)") }
    if root?.left != nil { search(root?.left, "\(currentPath)\(root!.val)->", &res) }
    if root?.right != nil { search(root?.right, "\(currentPath)\(root!.val)->", &res) }
}




binaryTreePaths(tree)


