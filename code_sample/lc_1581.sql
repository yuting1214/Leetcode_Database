# Solution 1(self, correct)
SELECT V.customer_id, COUNT(T.transaction_id) AS count_no_trans 
FROM Visits V
LEFT JOIN  Transactions T
USING(visit_id)
WHERE T.transaction_id is NULL
GROUP BY V.customer_id 
