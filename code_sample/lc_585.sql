# Table
CREATE TABLE insurance 
(
     PID 	INT,
     TIV_2015 	INT,
     TIV_2016 	INT,
     LAT 	INT,
     LON 	INT
);

INSERT INTO insurance  ( PID , TIV_2015 , TIV_2016 , LAT , LON )
VALUES
    (1, 10, 5, 10, 10),
    (2, 20, 20, 20, 20),
    (3, 10, 30, 20, 20),
    (4, 10, 40, 40, 40);

# Solution 1(self, correct)
SELECT ROUND(SUM(TIV_2016), 2) AS 'TIV_2016' 
FROM insurance
WHERE 
PID NOT IN 
(SELECT DISTINCT I1.PID
FROM insurance I1, insurance I2
WHERE I1.PID != I2.PID
AND I1.LAT = I2.LAT
AND I1.LON = I2.LON)
AND TIV_2015 IN
(SELECT TIV_2015
FROM insurance
GROUP BY TIV_2015 
HAVING count(PID) > 1)

# Solution 2(reference, correct)
SELECT ROUND(SUM(distinct_table.TIV_2016),2) AS "TIV_2016"
FROM (
    SELECT DISTINCT i.PID, i.TIV_2016, i3.LAT AS "LAT"
    FROM insurance i
    JOIN insurance i2 ON i.TIV_2015 = i2.TIV_2015 AND i.PID != i2.PID
    LEFT JOIN insurance i3 ON i.LAT = i3.LAT AND i.LON = i3.LON AND i.PID != i3.PID
    ) distinct_table
WHERE distinct_table.LAT IS NULL
