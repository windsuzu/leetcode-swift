/* 2017. 8. 16
 
 You need to construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way.
 
 The null node needs to be represented by empty parenthesis pair "()". And you need to omit all the empty parenthesis pairs that don't affect the one-to-one mapping relationship between the string and the original binary tree.
 
 將二元樹化為字串，格式為 root(left(left))(right) ，空的節點表示為()，但不會影響到其他節點的空節點得省略。
 
 Example 1:
 Input: Binary tree: [1,2,3,4]
        1
      /   \
     2     3
    /
   4
 
 Output: "1(2(4))(3)"
 
 Explanation: Originallay it needs to be "1(2(4)())(3()())",
 but you need to omit all the unnecessary empty parenthesis pairs.
 And it will be "1(2(4))(3)".
 
 [1,2,3,4] 可以得出 1(2(4)())(3()()) ，消除不必要的空節點可以得到 1(2(4))(3)
 
 
 Example 2:
 Input: Binary tree: [1,2,3,null,4]
        1
      /   \
     2     3
      \
       4
 
 Output: "1(2()(4))(3)"
 
 Explanation: Almost the same as the first example,
 except we can't omit the first parenthesis pair to break the one-to-one mapping relationship between the input and the output.
 
 跟第一題差不多，多的是不能省略 4 前面的空節點。
 
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

// tree : [1,2,3,4]

var tree = TreeNode(1)
tree.left = TreeNode(2)
tree.right = TreeNode(3)
tree.left?.left = TreeNode(4)


/* 解題 */

func tree2str(_ t: TreeNode?) -> String {
    guard let t = t else {
        return ""
    }
    let result = "\(t.val)"
    let left = tree2str(t.left)
    let right = tree2str(t.right)
    
    if left.isEmpty && right.isEmpty { return result }
    if left.isEmpty { return "\(result)()(\(right))" }
    if right.isEmpty { return "\(result)(\(left))"}
    return "\(result)(\(left))(\(right))"
}


tree2str(tree)




