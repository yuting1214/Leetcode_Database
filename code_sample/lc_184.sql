# Solution 1
SELECT 
  D.Name Department,
  E.Name Employee,
  E.Salary Salary
FROM Employee E
LEFT JOIN Department D 
ON E.DepartmentId =  D.Id
WHERE (D.Name, E.Salary) IN
(SELECT D.Name, Max(Salary) maximum_salary_depart
FROM Employee E
LEFT JOIN Department D 
ON E.DepartmentId =  D.Id
GROUP BY D.Name);
