# Table 1
CREATE TABLE Products 
(
     product_id 	integer,
     product_name 	varchar(300),
     product_category 	varchar(255)
);

INSERT INTO Products ( product_id , product_name , product_category )
VALUES
    (1, 'Leetcode Solutions', 'Book'),
    (2, 'Jewels of Stringology', 'Book'),
    (3, 'HP', 'Laptop'),
    (4, 'Lenovo', 'Laptop'),
    (5, 'Leetcode Kit', 'T-shirt');
    
#  Table 2
CREATE TABLE Orders
(
     product_id 	int,
     order_date 	date,
     unit 	int
);
INSERT INTO Orders ( product_id , order_date , unit )
VALUES
    (1, '2020-02-05', 60),
    (1, '2020-02-10', 70),
    (2, '2020-01-18', 30),
    (2, '2020-02-11', 80),
    (3, '2020-02-17', 2),
    (3, '2020-02-24', 3),
    (4, '2020-03-01', 20),
    (4, '2020-03-04', 30),
    (4, '2020-03-04', 60),
    (5, '2020-02-25', 50),
    (5, '2020-02-27', 50),
    (5, '2020-03-01', 50);

# Solution 1 (self, correct)
SELECT P.product_name, SUM(unit) AS unit
FROM Products P
LEFT JOIN Orders O
ON P.product_id = O.product_id
WHERE EXTRACT(YEAR_MONTH FROM O.order_date) = '202002'
GROUP BY P.product_id, P.product_name
HAVING SUM(unit) >= 100;

# Solution 2(self, correct)
SELECT P.product_name,  grouped_table.total_amount AS unit
FROM Products P
LEFT JOIN 
(SELECT product_id, SUM(unit) as total_amount
FROM Orders 
WHERE EXTRACT(YEAR_MONTH FROM order_date) = '202002'
GROUP BY product_id ) grouped_table
ON P.product_id = grouped_table.product_id
WHERE grouped_table.total_amount >= 100;
