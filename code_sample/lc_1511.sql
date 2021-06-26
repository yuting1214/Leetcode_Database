# Talbe 
## 1.
CREATE TABLE Customers
(
     customer_id 	int,
     name 	varchar(300),
     country 	varchar(255)
);
INSERT INTO Customers ( customer_id , name , country )
VALUES
    (1, 'Winston', 'USA'),
    (2, 'Jonathan', 'Peru'),
    (3, 'Moustafa', 'Egypt');
## 2.
CREATE TABLE Product
(
     product_id 	int,
     description 	varchar(300),
     price 	int
);
INSERT INTO Product ( product_id , description , price )
VALUES
    (10, 'LC Phone', 300),
    (20, 'LC T-Shirt', 10),
    (30, 'LC Book', 45),
    (40, 'LC Keychain', 2);
## 3.
CREATE TABLE Orders
(
     order_id 	int,
     customer_id 	int,
     product_id 	int,
     order_date 	date,
     quantity 	int
);
INSERT INTO Orders ( order_id , customer_id , product_id , order_date , quantity )
VALUES
    (1, 1, 10, '2020-06-10', 1),
    (2, 1, 20, '2020-07-01', 1),
    (3, 1, 30, '2020-07-08', 2),
    (4, 2, 10, '2020-06-15', 2),
    (5, 2, 40, '2020-07-01', 10),
    (6, 3, 20, '2020-06-24', 2),
    (7, 3, 30, '2020-06-25', 2),
    (9, 3, 30, '2020-05-08', 3);
    
# Solution 1

With date_table AS(
  SELECT '2020-06' AS month;
  UNION ALL SELECT '2020-07' AS month;
)
SELECT customer_id 
FROM Customers


FROM
Orders O
LEFT JOIN Product P
USING(product_id)
WHERE 
  O.order_date >= '2020-06-01' AND
   O.order_date < '2020-08-01'
GROUP BY O.customer_id, EXTRACT(Month FROM O.order_date)
