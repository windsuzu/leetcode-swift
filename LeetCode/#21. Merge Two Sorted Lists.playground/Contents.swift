/* 2017. 10. 10
 
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 合併兩個已經被排序過的鏈結串列返回一個全新的鏈結串列。
 新的串列必須保持排序。
 
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var list1 = ListNode(1)
list1.next = ListNode(2)
list1.next?.next = ListNode(3)

var list2 = ListNode(1)
list2.next = ListNode(4)
list2.next?.next = ListNode(5)



func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    if l1!.val < l2!.val {
        l1!.next = mergeTwoLists(l1!.next, l2)
        return l1
    } else {
        l2!.next = mergeTwoLists(l2!.next, l1)
        return l2
    }
}



mergeTwoLists(list1, list2)

