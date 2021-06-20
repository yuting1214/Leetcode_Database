# Solution 1 (self, wrong)
SELECT max(num) 
FROM Test
GROUP BY num
HAVING Count(num) = 1;

# Solution 2 (self, correct)
SELECT num
FROM Test
GROUP BY num
HAVING Count(num) = 1
ORDER BY num desc
LIMIT 1;

# Solution 3 (self, correct)
SELECT MAX(num) as num
FROM
  (SELECT num
  FROM Test
  GROUP BY num
  HAVING Count(num) = 1) grouped
