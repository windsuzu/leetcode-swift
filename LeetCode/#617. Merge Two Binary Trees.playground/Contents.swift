/* 2017. 7. 25
 
 Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
 
 給你兩個二元樹，想像當其中一棵樹覆蓋對方時，某些節點可能會重疊，某些可能不會。
 
 You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
 
 你必須要合併兩棵樹變成一棵新的二元樹。合併規則是這樣：如果兩個節點重疊，那就相加兩個值變成新的節點，如果有一個值不存在，就由不為空的值成為新的節點。
 
 
 Example 1:
 Input:
	Tree 1                     Tree 2
      1                         2
     / \                       / \
    3   2                     1   3
   /                           \   \
  5                             4   7
 
 
 Output:
 Merged tree:
     3
    / \
   4   5
  / \   \
 5   4   7
 
 
 Note: The merging process must start from the root nodes of both trees.
 
 合併的過程必須從兩棵樹的最頂端開始。
 
 */

// Definition for a binary tree node.

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

// tree1 : [1,3,2,5]

var tree1 = TreeNode(1)
tree1.left = TreeNode(3)
tree1.right = TreeNode(2)
tree1.left?.left = TreeNode(5)




// tree2 : [2,1,3,null,4,null,7]

var tree2 = TreeNode(2)
tree2.left = TreeNode(1)
tree2.right = TreeNode(3)
tree2.left?.right = TreeNode(4)
tree2.right?.right = TreeNode(7)



// 第一次提交 : Accepted

func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    var newNode: TreeNode? = nil
    
    if t1 == nil && t2 == nil {
        return newNode
    } else if t1 != nil && t2 != nil {
        newNode = TreeNode(t1!.val + t2!.val)
    } else {
        newNode = t1 == nil ? t2 : t1
    }
    
    newNode?.left = mergeTrees(t1?.left, t2?.left)
    newNode?.right = mergeTrees(t1?.right, t2?.right)
    
    return newNode
}

print(mergeTrees(tree1, tree2)!)


