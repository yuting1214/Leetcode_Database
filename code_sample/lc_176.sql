SELECT MAX(Salary) AS  SecondHighestSalary
FROM Employee
WHERE Salary != (select max(Salary) from Employee )
