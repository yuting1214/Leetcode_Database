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
    
SELECT
    Score,
    Id,
	DENSE_RANK () OVER (
		ORDER BY 
		Score DESC) AS rank_
FROM 
tableName
ORDER BY Id;
