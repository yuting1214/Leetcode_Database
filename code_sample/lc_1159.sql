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
