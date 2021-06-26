# Solution 1 (self, correct)
SELECT S.id, S.name
FROM Students S
LEFT JOIN Departments D
ON D.id = S.department_id
WHERE D.name is NULL

# Solution 2(reference, correct)
select id, name
from Students
where department_id not in (select id from Departments);
