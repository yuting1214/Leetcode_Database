
# Solution 1 (self, correct)
SELECT EUNI.unique_id, E.name 
FROM Employee E
LEFT JOIN EmployeeUNI EUNI
ON E.id = EUNI.ID
