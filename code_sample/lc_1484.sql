# Table
CREATE TABLE Activities
(
     sell_date 	date,
     product 	varchar(255)
);

INSERT INTO Activities ( sell_date , product )
VALUES
    ('2020-05-30', 'Headphone'),
    ('2020-06-01', 'Pencil'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'Basketball'),
    ('2020-06-01', 'Bible'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'T-Shirt');
  
# Solution 1(self, correct)
SELECT 
  sell_date,
  COUNT(product) AS num_sold,
  group_concat(product ORDER BY product separator ',') AS products
FROM 
(SELECT DISTINCT sell_date, product
FROM Activities) unique_table
GROUP BY sell_date
ORDER BY sell_date;

# Solution 2(reference, correct)
select sell_date, count(distinct product) as num_sold,  group_concat(distinct product) as products
from Activities 
group by sell_date
order by sell_date

# Solution 3(reference, correct)
SELECT a.sell_date, COUNT(DISTINCT a.product) AS 'num_sold'
      ,GROUP_CONCAT(DISTINCT a.product ORDER BY a.product ASC SEPARATOR ',') AS 'products'
FROM Activities a
GROUP BY a.sell_date

