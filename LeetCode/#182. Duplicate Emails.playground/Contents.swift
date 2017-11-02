/* 2017. 9. 28
 
 Write a SQL query to find all duplicate emails in a table named Person.
 
 +----+---------+
 | Id | Email   |
 +----+---------+
 | 1  | a@b.com |
 | 2  | c@d.com |
 | 3  | a@b.com |
 +----+---------+
 
 寫出 SQL Query 從 Person 找出所有有重複的 email 資料。
 
 
 For example, your query should return the following for the above table:
 
 +---------+
 | Email   |
 +---------+
 | a@b.com |
 +---------+
 
 根據上面的例子，應該要回傳這樣的表。
 
 */


let query =
"SELECT Email " +
"FROM Person " +
"GROUP BY Email " +
"HAVING count(*) > 1"


print(query)

