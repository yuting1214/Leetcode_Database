# Table
## 1. Customer
CREATE TABLE Customer
(
     customer_id 	varchar(300),
     product_key 	varchar(255)
);
INSERT INTO Customer ( customer_id , product_key )
VALUES
    ('1', '5'),
    ('2', '6'),
    ('3', '5'),
    ('3', '6'),
    ('1', '6');
## 2. Product
CREATE TABLE Product
(
     product_key 	varchar(255)
);
INSERT INTO Product (product_key )
VALUES
    ('5'),
    ('6');
    
# Solution 1(self, correct)
SELECT customer_id 
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product)
