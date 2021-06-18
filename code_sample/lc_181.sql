# Write your MySQL query statement below
SELECT 
    E.Name AS Employee
FROM Employee AS E
LEFT JOIN Employee AS M
ON E.ManagerID = M.Id
WHERE E.Salary > M.Salary;
