# Table
CREATE TABLE seat
(
     id 	int,
     student 	varchar(255)
);
INSERT INTO seat ( id , student )
VALUES
    (1, 'Abbot'),
    (2, 'Doris'),
    (3, 'Emerson'),
    (4, 'Green'),
    (5, 'Jeames'),
    (6, 'Mark');
    
# Solution 1(self, correct)
SELECT 
    O.id,
    CASE WHEN O.id % 2 = 0 THEN P.student
         WHEN (O.id % 2 = 1 AND N.student is not NULL) THEN N.student
         ELSE O.student END 'student'
FROM seat O
LEFT JOIN seat N
ON O.id = (N.id - 1)
LEFT JOIN seat P
ON O.id = (P.id + 1)
