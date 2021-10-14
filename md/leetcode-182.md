---
title: LeetCode#182 Duplicate Emails - in MySQL
date: 2017-09-28 12:11:41
tags:
- LeetCode
- MySQL
categories:
- LeetCode
- MySQL
---

# 題目

Write a SQL query to find all duplicate emails in a table named Person.

``` SQL
+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
```
寫出 SQL Query 從 Person 找出所有有重複的 email 資料。

---

# 範例

For example, your query should return the following for the above table:

``` SQL
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
```
根據上面的例子，應該要回傳這樣的表。

---

# 解題

首先用 GROUP BY 將 Email 分組起來。

再來利用 HAVING 找出分組後誰的 Email 數量大於 1 的即可。

``` SQL
SELECT Email
FROM Person
GROUP BY Email
HAVING count(Email) > 1
```