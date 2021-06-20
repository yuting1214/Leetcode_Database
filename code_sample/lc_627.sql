# Concept
## Swap

# Solution 1 (self, wrong)
UPDATE salary O
SET O.sex = N.sex
FROM salary N
WHERE O.sex != N.sex;

# Solution 2 (reference, correct in MySQL)
update salary
set sex = if (sex='m', 'f', 'm')

# Solution 3 (self, correct in PostgreSQL)
UPDATE Test 
set sex = (CASE WHEN sex = 'm' THEN 'f' ELSE 'm' end);
