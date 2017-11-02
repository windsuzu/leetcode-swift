/* 2017. 10. 4 
 
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 給一個升序鏈結串列，刪除所有重複的元素。
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
 
 */


/**
 * Definition for singly-linked list.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var head = ListNode(1)
head.next = ListNode(1)
head.next?.next = ListNode(2)
head.next?.next?.next = ListNode(3)
head.next?.next?.next?.next = ListNode(4)
head.next?.next?.next?.next?.next = ListNode(4)

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }
    head!.next = deleteDuplicates(head!.next)
    return head!.val == head!.next?.val ? head!.next : head
}

deleteDuplicates(head)


