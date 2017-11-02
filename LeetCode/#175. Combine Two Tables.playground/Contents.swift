/* 2017. 10. 19
 
 Table: Person
 
 +-------------+---------+
 | Column Name | Type    |
 +-------------+---------+
 | PersonId    | int     |
 | FirstName   | varchar |
 | LastName    | varchar |
 +-------------+---------+
 PersonId is the primary key column for this table.
 
 PersonId 是這個表格的主鍵。
 
 Table: Address
 
 +-------------+---------+
 | Column Name | Type    |
 +-------------+---------+
 | AddressId   | int     |
 | PersonId    | int     |
 | City        | varchar |
 | State       | varchar |
 +-------------+---------+
 AddressId is the primary key column for this table.
 
 AddressId 是這個表格的主鍵。
 
 
 Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
 
 FirstName, LastName, City, State
 
 寫一個 SQL 查詢，回傳每一個 Person 的值，以及其對應的 Address 欄位，
 FirstName, LastName, City, State ，
 不管有沒有對應的 Address 都要傳回。
 
 */

let query =
"SELECT FirstName, LastName, City, State " +
"FROM Person " +
"LEFT JOIN Address ON Person.PersonId = Address.PersonId"

print(query)
