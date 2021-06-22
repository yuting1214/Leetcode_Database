# Solution 1 (self)
SELECT ROUND(SUM(D.order_date = D.customer_pref_delivery_date) / COUNT(*) * 100, 2) AS immediate_percentage 
FROM Delivery AS D
WHERE (customer_id, order_date) IN
(SELECT customer_id, MIN(order_date)
FROM Delivery
GROUP BY customer_id)

# Solution 2 (reference)
select round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end) * 100.0 / count(delivery_id), 2) as immediate_percentage
from delivery
where (customer_id, order_date) in 
    (select customer_id, min(order_date) 
     from delivery 
     group by customer_id)
