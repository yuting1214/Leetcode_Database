# Solution 1(self, correct)
SELECT DISTINCT C.title
FROM TVProgram T
LEFT JOIN Content C
ON T.content_id = C.content_id
WHERE 
  T.program_date >= '2020-06-01' AND
  T.program_date < '2020-07-01' AND
  C.Kids_content = 'Y' AND
  C.content_type = 'Movies';
