/* 2017. 9. 8
 
 Reverse a singly linked list.
 
 反轉連結串列。
 
 */


/**
 * Definition for singly-linked list. */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var list = ListNode(1)
list.next = ListNode(2)
list.next?.next = ListNode(3)
list.next?.next?.next = ListNode(4)
list.next?.next?.next?.next = ListNode(5)






/* 解題 */

func reverseList(_ head: ListNode?) -> ListNode? {
    guard let val = head?.val else {
        return nil
    }
    var res = ListNode(val)
    
    func reverse(_ head: ListNode?) {
        guard let node = head else {
            return
        }
        let newNode = ListNode(node.val)
        newNode.next = res
        res = newNode
        
        reverse(node.next)
    }
    reverse(head?.next)
    return res
}

reverseList(list)



