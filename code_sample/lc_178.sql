CREATE TABLE tableName
(
     Id 	varchar(300),
     Score 	varchar(255)
);

INSERT INTO tableName ( Id , Score )
VALUES
    (1, 3.50),
    (2, 3.65),
    (3, 4.00),
    (4, 3.85),
    (5, 4.00),
    (6, 3.65);

# Solution 1(self, correct)
SELECT
    Score,
    Id,
	DENSE_RANK () OVER (
		ORDER BY 
		Score DESC) AS rank_
FROM 
tableName
ORDER BY Id;

# Solution 2(reference, correct)
SELECT s.Score, 
       (SELECT COUNT(DISTINCT s2.Score)
        FROM tablename s2
        WHERE s2.Score > s.Score) + 1 AS "Rank"
FROM tablename s
ORDER BY s.Score DESC
