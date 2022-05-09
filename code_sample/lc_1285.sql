# Data
CREATE TABLE Logs  
(
    log_id	int
);

INSERT INTO Logs  (log_id)
VALUES
    (1),
    (2),
    (3),
    (7),
    (8),
    (10);

# Solution 1(reference)

select min(log_id), max(log_id)
from (select l.log_id, (l.log_id - l.row_num) as diff
      from (select log_id, row_number() over() as row_num from Logs) l
      ) l2
group by diff;

# Solution 2(reference)
SELECT MIN(g.log_id) AS 'start_id', MAX(g.log_id) AS 'end_id'
FROM (
    SELECT l.log_id, (l.log_id - ROW_NUMBER() OVER()) AS group_id
    FROM Logs l
    ) g
GROUP BY g.group_id
ORDER BY start_id ASC
