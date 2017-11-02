/* 2017. 9. 3
 
 Given two binary trees, write a function to check if they are equal or not.
 
 Two binary trees are considered equal if they are structurally identical and the nodes have the same value.
 
 寫一個函式，確認兩個二元樹是否相等。
 
 節點位置跟每個值皆相等即為完全相等。
 
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


// tree : [3,9,20,15,7,nil,nil,nil,nil,nil,10]

var tree = TreeNode(3)
tree.left = TreeNode(9)
tree.right = TreeNode(20)
tree.left?.left = TreeNode(15)
tree.left?.right = TreeNode(7)
tree.left?.right?.left = TreeNode(10)


var tree2 = TreeNode(3)
tree2.left = TreeNode(9)
tree2.right = TreeNode(20)
tree2.left?.left = TreeNode(15)
tree2.left?.right = TreeNode(7)
tree2.left?.right?.left = TreeNode(10)


func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    
    if let p = p, let q = q, p.val == q.val {
        let c1 = isSameTree(p.left, q.left)
        let c2 = isSameTree(p.right, q.right)
        return c1 && c2
    }
    
    return false
}


isSameTree(tree, tree2)




