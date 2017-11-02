/* 2017. 8. 30
 
 Given a binary tree, return the tilt of the whole tree.
 
 The tilt of a tree node is defined as the absolute difference between the sum of all left subtree node values and the sum of all right subtree node values. Null node has tilt 0.
 
 The tilt of the whole tree is defined as the sum of all nodes' tilt.
 
 
 計算一個二元樹的傾斜值，一個節點的傾斜值來自其左右兩邊子樹個別總和起來相減的絕對值。
 
 現在算出所有節點的傾斜值，並且加總起來。
 
 Example:
 
 Input:
    1
  /   \
 2     3
 
 Output: 1
 
 Explanation:
 Tilt of node 2 : 0
 Tilt of node 3 : 0
 Tilt of node 1 : |2-3| = 1
 Tilt of binary tree : 0 + 0 + 1 = 1
 
 2 、 3 沒有任何子節點，所以傾斜值為 0 ， 1 的傾斜值為 |2 - 3| = 1 ，加總起來為 1 。
 
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


/* 解題 */

func findTilt(_ root: TreeNode?) -> Int {
    var res = 0
    
    func postorder(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        print(root.val)
        
        let left = postorder(root.left)
        let right = postorder(root.right)
        
        print(left, right)
        
        res += Int(abs(left - right))
        
        print("")
        
        return left + right + root.val
    }
    postorder(root)
    
    return res
}



findTilt(tree)
