# Concept
## Operator: /	Divide	
## Operator: %	Modulo

# Solution 1
SELECT *
FROM cinema
WHERE (id % 2) != 0 AND description != 'boring'
ORDER BY rating DESC;
