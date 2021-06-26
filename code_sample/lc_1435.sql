# Table
CREATE TABLE Sessions 
(
     session_id 	integer,
     duration 	integer
);

INSERT INTO Sessions (session_id, duration)
VALUES
    (1, 30),
    (2, 199),
    (3, 299),
    (4, 580),
    (5, 1000);
    
# Solution 1(self, wrong)
SELECT bin_table.bin , COUNT( bin_table.session_id)
FROM 
(SELECT
  session_id,
  CASE 
  WHEN duration / 60 < 5 THEN '[0-5>'
  WHEN duration / 60 < 10 THEN '[5-10>'
  WHEN duration / 60 < 15 THEN '[10-15>'
  ELSE '15 or more'
  END bin
FROM Sessions) bin_table
GROUP BY bin_table.bin

# Solution 2(reference, correct)
select '[0-5>' as bin, count(session_id) as total
from Sessions
where duration < 300
union
select '[5-10>' as bin, count(session_id) as total
from Sessions
where duration >= 300 and duration < 600
union
select '[10-15>' as bin, count(session_id) as total
from Sessions
where duration < 900 and duration >= 600
union
select '15 or more' as bin, count(session_id) as total
from Sessions
where duration >= 900
# Solution 3(reference, correct)

# Solution 3(reference, correct)
WITH bins AS (
    SELECT "[0-5>" AS bin
    UNION ALL SELECT "[5-10>" AS bin
    UNION ALL SELECT "[10-15>" AS bin
    UNION ALL SELECT "15 or more" AS bin
)
SELECT bins.bin, IFNULL(bin_result.total, 0) AS 'total'
FROM bins
LEFT JOIN (
    SELECT b.bin, COUNT(1) AS "total"
    FROM (
        SELECT CASE WHEN s.duration < 5 * 60 THEN "[0-5>"
                    WHEN s.duration < 10 * 60 THEN "[5-10>"
                    WHEN s.duration < 15 * 60 THEN "[10-15>"
                    ELSE "15 or more" END AS 'bin'
        FROM Sessions s
        ) b
    GROUP BY b.bin
    ) bin_result
ON bins.bin = bin_result.bin
