/* 2017. 8. 4
 
 Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 
 給一個不為空的二元樹，請輸出這個二元樹每一層的平均值。
 
 Example 1:
 Input:
     3
    / \
   9  20
      / \
     15  7
 
 Output: [3, 14.5, 11]
 
 Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
 
 第 0 層平均值是 3 ， 第 1 層平均值是 (9+20)/2 = 14.5 ， 第 2 層是 11 。
 所以返回 [3, 14.5, 11] 。
 
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

// tree : [3,9,20,15,7]

var tree = TreeNode(3)
tree.left = TreeNode(9)
tree.right = TreeNode(20)
tree.left?.left = TreeNode(15)
tree.left?.right = TreeNode(7)



/* 第一次解題 */

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    var result = [Double]()
    guard let root = root else {
        return result
    }
    
    var queue = [root]
    
    while !queue.isEmpty {
        let n = queue.count
        var sum = 0
        for _ in 0..<n {
            let node = queue.removeFirst()
            sum += node.val
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        let avarage = Double(sum) / Double(n)
        result.append(avarage)
    }
    return result
}

averageOfLevels(tree)









