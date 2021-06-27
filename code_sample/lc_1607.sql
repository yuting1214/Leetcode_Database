# Table
CREATE TABLE Orders
(
     order_id 	varchar(300),
     sale_date 	varchar(300),
     order_cost 	varchar(300),
     customer_id 	varchar(300),
     seller_id 	varchar(255)
);

INSERT INTO Orders ( order_id , sale_date , order_cost , customer_id , seller_id )
VALUES
    ('1', '2020-03-01', '1500', '101', '1'),
    ('2', '2020-05-25', '2400', '102', '2'),
    ('3', '2019-05-25', '800', '101', '3'),
    ('4', '2020-09-13', '1000', '103', '2'),
    ('5', '2019-02-11', '700', '101', '2');
    
CREATE TABLE Seller
(
     seller_id 	varchar(300),
     seller_name 	varchar(255)
);

INSERT INTO Seller ( seller_id , seller_name )
VALUES
    ('1', 'Daniel'),
    ('2', 'Elizabeth'),
    ('3', 'Frank');
    
# Solution 1(self, correct)
SELECT seller_name 
FROM Seller 
WHERE seller_id NOT IN 
(SELECT DISTINCT seller_id
FROM Orders
WHERE sale_date >= '2020-01-01')
ORDER BY seller_name;
