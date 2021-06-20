# Solution 1
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
