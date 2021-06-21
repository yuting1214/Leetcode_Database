# Solution 1 (self, correct)
SELECT P.project_id
FROM 
    (SELECT project_id, count(employee_id) employee_num
    FROM Project
    GROUP BY project_id) P
WHERE P.employee_num = 
    (SELECT MAX(employee_num)
    FROM 
    (SELECT project_id, count(employee_id) employee_num
    FROM Project
    GROUP BY project_id) P_new);

# Solution 2 (reference, correct)
SELECT P.project_id
FROM Project P
GROUP BY project_id
HAVING count(P.employee_id) = 
    (SELECT MAX(P_new.employee_num)
    FROM 
    (SELECT project_id, count(employee_id) employee_num
    FROM Project
    GROUP BY project_id) P_new);
