# Table
## 1. Users
CREATE TABLE Users
(
     user_id 	varchar(300),
     join_date 	date,
     favorite_brand 	varchar(255)
);
INSERT INTO Users ( user_id , join_date , favorite_brand )
VALUES
    ('1', '2019-01-01', 'Lenovo'),
    ('2', '2019-02-09', 'Samsung'),
    ('3', '2019-01-19', 'LG'),
    ('4', '2019-05-21', 'HP');
## 2. Orders
CREATE TABLE Orders
(
     order_id 	varchar(300),
     order_date 	date,
     item_id 	varchar(300),
     buyer_id 	varchar(300),
     seller_id 	varchar(255)
);
INSERT INTO Orders ( order_id , order_date , item_id , buyer_id , seller_id )
VALUES
    ('1', '2019-08-01', '4', '1', '2'),
    ('2', '2019-08-02', '2', '1', '3'),
    ('3', '2019-08-03', '3', '2', '3'),
    ('4', '2019-08-04', '1', '4', '2'),
    ('5', '2019-08-04', '1', '3', '4'),
    ('6', '2019-08-05', '2', '2', '4');
## 3. Items
CREATE TABLE Items 
(
     item_id 	varchar(300),
     item_brand 	varchar(255)
);

INSERT INTO Items  ( item_id , item_brand )
VALUES
    ('1', 'Samsung'),
    ('2', 'Lenovo'),
    ('3', 'LG'),
    ('4', 'HP');

# Solution 1(self, correct)
SELECT
  F.user_id,
  (CASE WHEN F.item_id = Second.second_item_id THEN 'yes' ELSE 'no' END) 2nd_item_fav_brand 
FROM
  (SELECT
    U.user_id,
    I.item_id 
  FROM Users U
  LEFT JOIN Items I
  ON U.favorite_brand = I.item_brand) F
LEFT JOIN 
  (SELECT
      seller_id,
      second_item_id	
  FROM 
    (SELECT
        order_date,
        seller_id,
        LEAD(item_id, 1) OVER(PARTITION BY seller_id ORDER BY order_date) second_item_id,
        FIRST_VALUE(order_date) OVER(PARTITION BY seller_id ORDER BY order_date) start_date    
    FROM Orders) S
  WHERE order_date = start_date) Second
ON F.user_id = Second.seller_id 
