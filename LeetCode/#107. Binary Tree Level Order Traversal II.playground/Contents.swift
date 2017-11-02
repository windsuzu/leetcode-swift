/* 2017. 9. 27
 
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 給定二元樹，返回他從底部到根部的節點尋訪。 (由左到右，由層到層，從葉到根)
 
 For example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
        3
       / \
      9  20
        /  \
       15   7
 
 return its bottom-up level order traversal as:
 
 [
    [15,7],
    [9,20],
    [3]
 ]
 
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

var tree = TreeNode(3)
tree.left = TreeNode(9)
tree.right = TreeNode(20)
tree.right?.left = TreeNode(15)
tree.right?.right = TreeNode(7)




/* AC 35 MS */

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    var res = [[Int]]()

    func bfs(_ root: TreeNode?, level: Int) {
        if root == nil {
            return
        }
        if level >= res.count {
            res.insert([Int](), at: 0)
            print("insert")
        }
        bfs(root!.left, level: level + 1)
        bfs(root!.right, level: level + 1)
        
        print("add value", root!.val)
        res[res.count - level - 1].append(root!.val)
    }
    
    bfs(root, level: 0)
    
    return res
}


levelOrderBottom(tree)


