/* 2017. 9. 25
 
 Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.
 
 給兩個不為空的二元樹 s 和 t 。
 
 驗證 t 是否相同於 s 的子樹，必須擁有相同的架構和值。
 
 s 子樹由 s 組成，所以 s 也可以視作 s 子樹。
 
 
 Example 1:
 
 Given tree s:
 
        3
       / \
      4   5
     / \
    1   2
 
 Given tree t:
 
      4
     / \
    1   2
 
 Return true, because t has the same structure and node values with a subtree of s.
 
 回傳 true ，因為 t 可以相同於 s 子樹。
 
 
 
 Example 2:
 
 Given tree s:
 
        3
       / \
      4   5
     / \
    1   2
   /
  0
 
 Given tree t:
 
      4
     / \
    1   2
 
 Return false.
 
 回傳 false ，因為 t 並沒有相同於任何 s 子樹。
 
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

let tree1 = TreeNode(1)
tree1.left = TreeNode(2)
tree1.right = TreeNode(3)
tree1.left?.left = TreeNode(4)
tree1.left?.right = TreeNode(5)

let tree2 = TreeNode(2)
tree2.left = TreeNode(4)
tree2.right = TreeNode(5)



func isSame(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil {
        return t == nil
    }
    if let s = s, let t = t, s.val == t.val {
        return isSame(s.left,t.left) && isSame(s.right,t.right)
    }
    return false
}


func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil {
        return t == nil
    }
    if let s = s, let t = t, s.val == t.val {
        return isSame(s,t) || isSame(s.left,t) || isSame(s.right,t)
    }
    return isSubtree(s?.left,t) || isSubtree(s?.right,t)
}


isSubtree(tree1, tree2)


