# Solution 1
SELECT P.project_id, P.employee_id 
FROM Project AS P
LEFT JOIN Employee AS E
ON  P.employee_id = E.employee_id
WHERE (P.project_id, E.experience_years) IN 
(SELECT project_id, MAX(experience_years ) most_years
FROM Project AS P
LEFT JOIN Employee AS E
ON  P.employee_id = E.employee_id
GROUP BY project_id) 
