---
title: LeetCode#83 Remove Linked List Elements - in Swift
date: 2017-10-04 17:03:47
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

Given a sorted linked list, delete all duplicates such that each element appear only once.

給一個以排序鏈結串列，刪除所有重複的元素。

---

# 範例

``` swift
Given 1->1->2, return 1->2.
Given 1->1->2->3->3, return 1->2->3.
```

---

# 解題

利用遞迴概念，若是該點 (A) 的 next (B) ，與 B 的 next (C) 重複，

則返回 C 成為 A 的新 next 。

![](leetcode-83/remove_nodes.gif)

``` swift
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }
    head!.next = deleteDuplicates(head!.next)
    return head!.val == head!.next?.val ? head!.next : head
}
```