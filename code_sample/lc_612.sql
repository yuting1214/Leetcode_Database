# Table
CREATE TABLE point_2d
(
     x 	INT,
     y 	INT
);
INSERT INTO point_2d ( x , y )
VALUES
    (-1, -1),
    (0, 0),
    (-1, -2);

# Solution 1(self, correct)
SELECT
  ROUND(MIN(SQRT(POWER((F.x - S.x), 2) + POWER((F.y - S.y), 2))),2) AS shortest 
FROM point_2d F, point_2d S
WHERE (F.x, F.y) != (S.x, S.y)

# Solution 2(reference, correct)
select round(sqrt(min((pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2)))), 2) as shortest
from point_2d p1
join point_2d p2 
on p1.x != p2.x or p1.y != p2.y
