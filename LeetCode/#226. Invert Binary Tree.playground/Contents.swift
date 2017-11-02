/* 2017. 8. 8
 
 Invert a binary tree.
 
 翻轉二元樹。
 
 
        4
      /   \
     2     7
    / \   / \
   1   3 6   9
 
 
 to
 
 
        4
      /   \
     7     2
    / \   / \
   9   6 3   1
 
 
 
 Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so fuck off.
 
 Homebrew 的開發者 Max Howell 在推特發文 (https://twitter.com/mxcl/status/608682016205344768) :
 
 Google: 雖然我們 90% 工程師都在用你寫的軟體（Homebrew），但你不能在白板上反轉二元樹，所以滾蛋。
 
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

// tree : [4,2,7,1,3,6,9]

var tree = TreeNode(4)
tree.left = TreeNode(2)
tree.right = TreeNode(7)
tree.left?.left = TreeNode(1)
tree.left?.right = TreeNode(3)
tree.right?.left? = TreeNode(6)
tree.right?.right? = TreeNode(9)


/* 第一次解題 : 19 ms
 
 把每層的左右換邊就好
 
        4
      /   \
     2     7
    / \   / \
   1   3 6   9
 
 第一次轉節點 2 跟 7
 
        4
      /   \
     7     2
    / \   / \
   6   9 1   3
 
 第二次轉 6 9
 
        4
      /   \
     7     2
    / \   / \
   9   6 1   3
 
 第三次轉 1 3
 
        4
      /   \
     7     2
    / \   / \
   9   6 3   1
 
 */

func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    let temp = root.left
    root.left = root.right
    root.right = temp
    
    invertTree(root.left)
    invertTree(root.right)
    
    return root
}




invertTree(tree)
