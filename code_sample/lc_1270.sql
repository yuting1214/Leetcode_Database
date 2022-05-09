# Data
CREATE TABLE Employees 
(
    employee_id	varchar(300),
    employee_name	varchar(300),
    manager_id	varchar(300)
);

INSERT INTO Employees (employee_id,employee_name,manager_id)
VALUES
    ('1', 'Boss', '1'),
    ('3', 'Alice', '3'),
    ('2', 'Bob', '1'),
    ('4', 'Daniel', '2'),
    ('7', 'Luis', '4'),
    ('8', 'Jhon', '3'),
    ('9', 'Angela', '8'),
    ('77', 'Robert', '1');

# Solution 1(self)
SELECT E1.employee_id
FROM Employees E1
LEFT JOIN Employees E2
ON E1.manager_id = E2.employee_id
LEFT JOIN Employees E3
ON E2.manager_id = E3.employee_id
WHERE (E1.manager_id = 1 OR E2.manager_id = 1 OR E3.manager_id = 1) AND E1.employee_id != 1;

# Solution 2(reference)
SELECT e3.Employee_id
FROM Employees e1
LEFT JOIN Employees e2
ON e1.Employee_id = e2.manager_id
LEFT JOIN Employees e3
ON e2.Employee_id = e3.manager_id
WHERE e1.manager_id = 1
AND e3.Employee_id != 1
