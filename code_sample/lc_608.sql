# Table
CREATE TABLE tree
(
     id 	INT,
     p_id 	INT
);

INSERT INTO tree ( id , p_id )
VALUES
    (1, NULL),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2);
    
# Solution 1(self, correct)
SELECT
 DISTINCT
  p.id,
  CASE WHEN p.p_id is NULL THEN 'Root'
  WHEN p.p_id IS NOT NULL AND c.p_id IS NOT NULL THEN 'Inner'
  ELSE 'Leaf' END Type
FROM tree p
LEFT JOIN tree c
ON p.id = c.p_id
