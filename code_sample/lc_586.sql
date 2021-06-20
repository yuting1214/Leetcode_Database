# Solution 1 (self)
SELECT customer_number 
FROM orders 
WHERE customer_number = (
SELECT customer_number
FROM (
	SELECT 
		customer_number,
		COUNT(order_number)
	FROM orders
	GROUP BY customer_number
	ORDER BY COUNT(order_number) DESC
	LIMIT 1) AS group_table
)
# Solution 2 (reference)
select customer_number
from orders
group by customer_number
order by count(customer_number) desc
limit 1
