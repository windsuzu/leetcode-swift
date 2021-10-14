---
title: LeetCode#595 Big Countries - in MySQL
date: 2017-07-24 09:03:46
tags:
- LeetCode
- SQL
categories: 
- LeetCode
- SQL
---

# 題目

這裡有一個 Table 叫作 "World"
 ```
 +-----------------+------------+------------+--------------+---------------+
 | name            | continent  | area       | population   | gdp           |
 +-----------------+------------+------------+--------------+---------------+
 | Afghanistan     | Asia       | 652230     | 25500100     | 20343000      |
 | Albania         | Europe     | 28748      | 2831741      | 12960000      |
 | Algeria         | Africa     | 2381741    | 37100000     | 188681000     |
 | Andorra         | Europe     | 468        | 78115        | 3712000       |
 | Angola          | Africa     | 1246700    | 20609294     | 100990000     |
 +-----------------+------------+------------+--------------+---------------+
 ```

 一個大的國家，必須要達成 「 area 超過 3000000 」 或是 「 population 超過 25000000 」
 
 現在請你撰寫一個 SQL QUERY 找出大的國家，並且列出他的 'name, population, area'
 
 依照上面的表格所示，查詢後的結果應該跟下表一樣:
 
 ```
 +--------------+-------------+--------------+
 | name         | population  | area         |
 +--------------+-------------+--------------+
 | Afghanistan  | 25500100    | 652230       |
 | Algeria      | 37100000    | 2381741      |
 +--------------+-------------+--------------+
```

# 第一次解題 : Accepted
``` SQL
SELECT name, population, area 
FROM World 
WHERE area > 3000000 OR population > 25000000
```


