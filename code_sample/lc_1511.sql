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
    
# Solution 1(self, correct)
With date_table as(
    SELECT '202006' AS month
    UNION ALL SELECT '202007' AS month
)
SELECT C.customer_id , C.name
FROM
(
SELECT group_table.customer_id
FROM 
(SELECT 
    month_table.customer_id AS customer_id, 
    month_table.month,
    IFNULL(SUM(P.price * O.quantity ), 0) AS amount
FROM
(SELECT customer_id, month
FROM Customers
CROSS JOIN date_table) month_table
LEFT JOIN Orders O
ON
    month_table.customer_id = O.customer_id AND
    month_table.month = EXTRACT(Year_MONTH FROM O.order_date)
LEFT JOIN Product P
ON O.product_id  = P.product_id  
GROUP BY month_table.customer_id, month_table.month) group_table
GROUP BY group_table.customer_id
HAVING SUM(group_table.amount < 100) = 0) result_table
LEFT JOIN Customers C
ON result_table.customer_id = C.customer_id;

# Solution 2(reference, correct)
SELECT C.customer_id, C.name
FROM
(
SELECT
    O.customer_id,
    SUM(CASE WHEN EXTRACT(Year_MONTH FROM O.order_date) = '202006' THEN P.price * O.quantity ELSE 0 END) AS June,
    SUM(CASE WHEN EXTRACT(Year_MONTH FROM O.order_date) = '202007' THEN P.price * O.quantity ELSE 0 END) AS July
FROM  Orders O
LEFT JOIN Product P
USING (product_id)
GROUP BY O.customer_id) pivot
LEFT JOIN Customers C
USING(customer_id)
WHERE pivot.June >= 100 AND pivot.July >= 100
