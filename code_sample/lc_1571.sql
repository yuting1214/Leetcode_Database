# Solution 1(self, correct)
SELECT 
  W.name AS warehouse_name,
  SUM(P.volume * W.units) AS volume  
FROM  Warehouse W
LEFT JOIN
(SELECT
  product_id,
  Width * Length * Height AS volume
FROM Products) P
ON W.product_id = P.product_id
GROUP BY W.name
