/* 2017. 8. 6
 
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 找出二元樹的最大深度。
 
 Example :
 
 Input:
        3
       / \
      9  20
     / \
    15  7
         \
         10
 
 Output: 4
 
 從根節點 3 走到 10 的距離最長，有 4 個節點。
 
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
tree.left?.right?.right = TreeNode(10)


/* 第一次解題 52 ms
func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    var depth = 0
    var temp = [root]
    while !temp.isEmpty {
        for node in temp {
            print(temp.map { $0!.val} )
            
            temp.removeFirst()
            
            if let node = node?.left {
                temp.append(node)
            }
            
            if let node = node?.right {
                temp.append(node)
            }
        }
        depth += 1
        print("--- next level ---")
    }
    return depth
}
*/



/* Recursive Solution : 32 ms 
 
 1 represent the root level = 1
 
 level 2 -> 1 + max(1, 1) // 9, 20 ✔
 
 level 3 -> 2 + max(1, 1) // 15, 7 ✔
 level 3 -> 2 + max(0, 0) // nothing under 20
 
 level 4 -> 3 + max(0, 0) // nothing under 15
 level 4 -> 3 + max(0, 1) // nil, 10 ✔ -> answer = 4
 
 level 5 -> 4 + max(0, 0) // nothing under 10
 
 */

func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    return 1 + max(maxDepth(root!.left), maxDepth(root!.right))
}

maxDepth(tree)



