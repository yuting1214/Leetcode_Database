# Solution 1(self, wrong)
SELECT
  U.user_id,
  U.join_date,
  COUNT(O.order_id)
FROM Users U
LEFT JOIN Orders O
ON U.user_id = O.buyer_id
WHERE EXTRACT(YEAR FROM O.order_date) = '2019'
GROUP BY U.user_id, U.join_date 

# Solution 2(reference, correct)
select user_id as buyer_id, join_date, 
    sum(case when order_id is not null then 1 else 0 end) as orders_in_2019
from users
left join orders on users.user_id = orders.buyer_id 
and year(order_date) = 2019
group by user_id, join_date
order by buyer_id
