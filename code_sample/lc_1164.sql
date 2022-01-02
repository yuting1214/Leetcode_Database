# Data
CREATE TABLE Products 
(
    product_id	varchar(300),
    new_price	INTEGER,
    change_date	DATE
);

INSERT INTO Products (product_id,new_price,change_date)
VALUES
    ('1', '20', '2019-08-14'),
    ('2', '50', '2019-08-14'),
    ('1', '30', '2019-08-15'),
    ('1', '35', '2019-08-16'),
    ('2', '65', '2019-08-17'),
    ('3', '20', '2019-08-18');


# Solution 1 (self)
SELECT u.product_id, ifnull(changed_table.new_price, 10) as price 
FROM 
(SELECT DISTINCT product_id
FROM Products) u
LEFT JOIN
(SELECT *
FROM Products
WHERE (product_id, change_date) IN 
(SELECT product_id, MAX(change_date) 
FROM Products
WHERE change_date <= '2019-08-16'
GROUP BY product_id)) changed_table
ON u.product_id = changed_table.product_id
