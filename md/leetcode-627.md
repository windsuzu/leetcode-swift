---
title: LeetCode#627 Swap Salary - in MySQL
date: 2017-07-27 13:37:05
tags:
- LeetCode
- SQL
categories: 
- LeetCode
- SQL
---

# 題目

Given a table `salary`, such as the one below, that has m=male and f=female values. Swap all f and m values (i.e., change all f values to m and vice versa) with a single update query and no intermediate temp table.

將 table `salary` 當中性別欄位的男性(m)與女性(f)全部對調過來，
 
必須使用單次的 SQL Query 並且不使用任何暫時的 table 記錄。

For example:
``` SQL 
 | id | name | sex | salary |
 |----|------|-----|--------|
 | 1  | A    | m   | 2500   |
 | 2  | B    | f   | 1500   |
 | 3  | C    | m   | 5500   |
 | 4  | D    | f   | 500    |
```
 
 After running your query, the above salary table should have the following rows:
 
 經過一次 SQL Query 後，可以看到性別都對調過來了:
 
 ``` SQL
 | id | name | sex | salary |
 |----|------|-----|--------|
 | 1  | A    | f   | 2500   |
 | 2  | B    | m   | 1500   |
 | 3  | C    | f   | 5500   |
 | 4  | D    | m   | 500    |
```



# 第一次解題 : Accepted

使用 SQL 中的 CASE ... WHEN 語法，就可以簡單做到

``` SQL
UPDATE salary SET sex = (
 CASE sex
 WHEN 'm' THEN 'f'
 WHEN 'f' THEN 'm'
 ELSE sex END
 )
```

更簡潔一點 :
 
``` SQL
UPDATE salary
 SET sex  = (CASE WHEN sex = 'm'
 THEN 'f'
 ELSE 'm'
 END)
```


# Best Solution

使用 SQL + XOR 算法 : 

```
ASCII('f') -> 109
ASCII('m') -> 102

109 ^ 102 = 11
1. 11 ^ 109 = 102
2. 11 ^ 102 = 109
```

所以在 SQL 中表示 :

``` SQL
UPDATE salary 
SET sex = CHAR(ASCII('f') ^ ASCII('m') ^ ASCII(sex))
```

或是 :

``` SQL
UPDATE salary
SET sex = CHAR(ASCII(sex) ^ 11)
```




