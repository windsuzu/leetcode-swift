/* 2017. 11. 3
 
 Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.
 
 給你兩個表格代表客人和點單記錄 (Customers & Orders) ，寫出一個 SQL Query ，找出哪些客人沒有點過任何東西。
 
 Table: Customers.
 
 +----+-------+
 | Id | Name  |
 +----+-------+
 | 1  | Joe   |
 | 2  | Henry |
 | 3  | Sam   |
 | 4  | Max   |
 +----+-------+
 
 Table: Orders.
 
 +----+------------+
 | Id | CustomerId |
 +----+------------+
 | 1  | 3          |
 | 2  | 1          |
 +----+------------+
 
 Using the above tables as example, return the following:
 
 +-----------+
 | Customers |
 +-----------+
 | Henry     |
 | Max       |
 +-----------+
 
 依照上方兩個表格的範例，可以查出 Henry 和 Max 沒有買過東西。
 
 */

/* NOT EXIST AC */
"""
SELECT C.Name
FROM Customers C
WHERE NOT EXISTS
(SELECT Id
FROM Orders O
WHERE C.Id = O.CustomerId)
"""


/* NOT IN AC */
"""
SELECT C.Name
FROM Customers C
WHERE C.Id NOT IN
(SELECT O.CustomerId
FROM Orders O)
"""


/* LEFT JOIN AC */
"""
SELECT C.Name
FROM Customers C
LEFT JOIN Orders O on C.Id = O.CustomerId
WHERE O.CustomerId is NULL
"""
