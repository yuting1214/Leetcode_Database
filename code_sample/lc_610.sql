# Prerequisite
##　1. The sum of the length of **any** two sides of a triangle is greater than the length of the third side.

# Solution 
SELECT *,
       CASE
           WHEN ( x + y - z) < 0 or ( x + z - y) < 0 or ( y + z - x) < 0
                THEN 'No'
            ELSE 'Yes'
       END triangle
FROM triangle;




