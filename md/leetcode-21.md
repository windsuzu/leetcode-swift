---
title: LeetCode#21 Merge Two Sorted Lists - in Swift
date: 2017-10-10 15:10:14
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

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

合併兩個已經被排序過的鏈結串列返回一個全新的鏈結串列。新的串列必須保持排序。

---

# 範例

``` swift
Input:
list1 = [1,2,3]
list2 = [2,3,4]

Output:
list = [1,2,2,3,3,4]
```

---

# 解題

比對兩組串列值，若 l1 < l2 則當前答案串列擺入 l1 ，並且將 l1.next 與沒有擺入的 l2 帶入下一個 next 比較。
若相反，將 l2 放進答案串列，並且將 l2.next 與沒有擺入的 l1 帶入下一個 next 比較。

直至某一方先到底，就將另一方剩下的串列都放進答案串列中。

![](leetcode-21/recursive.gif)

``` swift
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
```