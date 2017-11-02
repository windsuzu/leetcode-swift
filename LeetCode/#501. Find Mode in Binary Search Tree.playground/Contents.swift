/* 2017. 10. 23
 
 Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.
 
 給一二元搜尋樹 (BST) 包含重複節點，找出該樹的眾數 (mode(s)) (可能有多個) (出現最多次的元素) 。
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than or equal to the node's key.
 The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 假設該 BST 定義為下:
  1. 左子樹只包含「小於或等於」的節點
  2. 右子樹只包含「大於或等於」的節點
  3. 其餘左右子樹必須維持上述的規則
 
 
 For example:
 Given BST [1,null,2,2],
    1
     \
      2
     /
    2
 
 return [2].
 
 Note: If a tree has more than one mode, you can return them in any order.
 
 如果不止一個眾數，請回傳一個沒有限制排序的陣列。
 
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
tree.right = TreeNode(2)
tree.right?.left = TreeNode(1)
tree.right?.right = TreeNode(2)

func findMode(_ root: TreeNode?) -> [Int] {
    if root == nil { return [] }
    
    var map = [Int:Int]()
    var maxVal = 0
    
    func traverse(_ root: TreeNode?) {
        if root == nil { return }
        
        map[root!.val] = map[root!.val] != nil ? map[root!.val]! + 1 : 1
        maxVal = max(map[root!.val]!, maxVal)
        
        traverse(root!.left)
        traverse(root!.right)
    }
    
    traverse(root)
    
    var res = [Int]()
    for (k,v) in map {
        if v == maxVal { res.append(k) }
    }
    
    return res
}

findMode(tree)


