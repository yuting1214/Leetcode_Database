# Table
CREATE TABLE Employee
(
     Id 	varchar(300),
     Name 	varchar(300),
     Department 	varchar(300),
     ManagerId 	varchar(255)
);

INSERT INTO Employee ( Id , Name , Department , ManagerId )
VALUES
    ('101', 'John', 'A', NULL),
    ('102', 'Dan', 'A', '101'),
    ('103', 'James', 'A', '101'),
    ('104', 'Amy', 'A', '101'),
    ('105', 'Anne', 'A', '101'),
    ('106', 'Ron', 'B', '101');
  
# Solution 1(self, correct)
SELECT E.Name
FROM 
(SELECT ManagerId
FROM Employee
WHERE ManagerId IS NOT NULL
GROUP BY ManagerId
HAVING COUNT(Name) >= 5) count_table
LEFT JOIN Employee E 
ON count_table.ManagerId = E.Id

# Solution 2(reference, correct)
SELECT e2.Name
FROM Employee e2
INNER JOIN (
    SELECT e.ManagerId, COUNT(DISTINCT e.Id) AS "num_reporters"
    FROM Employee e
    GROUP BY e.ManagerId 
    HAVING num_reporters >= 5) reporters_table
ON e2.Id = reporters_table.ManagerId
