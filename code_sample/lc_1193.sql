# Data
SELECT DATE_FORMAT(t.trans_date, "%Y-%m") AS "month", t.country, 
       COUNT(DISTINCT t.id) AS "trans_count",
       COUNT(DISTINCT CASE WHEN t.state = "approved" THEN t.id END) AS "approved_count",
       SUM(t.amount) AS "trans_total_amount",
       SUM(CASE WHEN t.state = "approved" THEN t.amount ELSE 0 END) AS "approved_total_amount"
FROM Transactions t
GROUP BY DATE_FORMAT(t.trans_date, "%Y-%m"), t.country

# Solution 1(self)
SELECT  m.month, m.country, COUNT(m.id), SUM(m.state = "approved"),
        SUM(m.amount), SUM(IF(m.state = 'approved', m.amount, 0))
FROM
(SELECT id,country,state,amount, DATE_FORMAT(trans_date, '%Y-%m') as month
FROM Transactions) m
GROUP BY m.month, m.country

# Solution 2(reference)
SELECT DATE_FORMAT(t.trans_date, "%Y-%m") AS "month", t.country, 
       COUNT(DISTINCT t.id) AS "trans_count",
       COUNT(DISTINCT CASE WHEN t.state = "approved" THEN t.id END) AS "approved_count",
       SUM(t.amount) AS "trans_total_amount",
       SUM(CASE WHEN t.state = "approved" THEN t.amount ELSE 0 END) AS "approved_total_amount"
FROM Transactions t
GROUP BY DATE_FORMAT(t.trans_date, "%Y-%m"), t.country
