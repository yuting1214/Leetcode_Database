# Table
CREATE TABLE Employee
(
     employee_id 	int,
     team_id 	    int
);

INSERT INTO Employee ( employee_id , team_id )
VALUES
    (1, 8),
    (2, 8),
    (3, 8),
    (4, 7),
    (5, 9),
    (6, 9);
    
# Solution 1 (self, correct)
SELECT Employee.employee_id, count_table.team_size
FROM 
Employee
LEFT JOIN 
(SELECT team_id, COUNT(employee_id) AS team_size
FROM Employee
GROUP BY team_id) count_table
ON Employee.team_id = count_table.team_id

# Solution 2 (self, correct) by self-join
select e1.employee_id, count(e2.employee_id) as team_size
from Employee e1, Employee e2
where e1.team_id = e2.team_id
group by e1.employee_id, e2.team_id
order by e1.employee_id;

# Solution 3 (reference, correct) by self-(inner)-join
select e1.employee_id, count(e2.employee_id) as team_size
from Employee e1
inner join Employee e2 on e1.team_id = e2.team_id
group by e1.employee_id, e2.team_id
order by e1.employee_id;
