---
title: LeetCode#206 Reverse Linked List - in Swift
date: 2017-09-08 11:05:47
tags:
- LeetCode
- Swift
- Linked List
categories:
- LeetCode
- Swift
- Linked List
---

# 題目
Reverse a singly linked list.

反轉連結串列。

<img src="leetcode-206/intro.png" alt="intro" style="width:400px;">

---

# 解題

使用遞迴讀取每一組 ListNode ，將 Node 不斷往後推。

也就是把前一次讀取的 ListNode 變為下一次讀取時的 Next 。

![](leetcode-206/reverse.gif)

``` swift
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
```