/* 2017. 10. 28
 
 The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
 
 Employee 表格描述所有員工包含他們的主管。
 
 每個員工都有屬於自己的 Id ，還有他們主管的 Id 。
 
 +----+-------+--------+-----------+
 | Id | Name  | Salary | ManagerId |
 +----+-------+--------+-----------+
 | 1  | Joe   | 70000  | 3         |
 | 2  | Henry | 80000  | 4         |
 | 3  | Sam   | 60000  | NULL      |
 | 4  | Max   | 90000  | NULL      |
 +----+-------+--------+-----------+
 
 Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.
 
 現在寫出一個 SQL 查詢，找出有哪些員工賺的錢，比他們的主管還要多。
 
 根據上方的表格，可以得出只有 Joe 所賺的錢，比他的主管 Sam 還要多。
 
 回傳如下:
 
 +----------+
 | Employee |
 +----------+
 | Joe      |
 +----------+
 
 */

let query = "SELECT e1.Name as Employee " +
"FROM Employee e1 , Employee e2 " +
"WHERE e1.ManagerId = e2.Id AND e1.Salary > e2.Salary"

print(query)