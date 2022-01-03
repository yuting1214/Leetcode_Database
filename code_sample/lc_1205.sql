# data
CREATE TABLE Transactions
(
    id	varchar(300),
    country	varchar(300),
    state	varchar(300),
    amount	integer,
    trans_date	date
);

INSERT INTO Transactions (id,country,state,amount,trans_date)
VALUES
    ('101', 'US', 'approved', 1000, '2019-05-18'),
    ('102', 'US', 'declined', 2000, '2019-05-19'),
    ('103', 'US', 'approved', 3000, '2019-06-10'),
    ('104', 'US', 'approved', 4000, '2019-06-13'),
    ('105', 'US', 'approved', 5000, '2019-06-15');

CREATE TABLE Chargebacks 
(
    trans_id	varchar(300),
    trans_date	varchar(300)
);

INSERT INTO Chargebacks (trans_id,trans_date)
VALUES
    ('102', '2019-05-29'),
    ('101', '2019-06-30'),
    ('105', '2019-09-18');
    
# Solution 1 (self)
SELECT b.month, b.country, ifnull(a.approved_count,0), ifnull(a.approved_amount,0), b.chargeback_count, b.chargeback_amount
FROM
(select date_format(trans_date, '%Y-%m') month, country,
sum(state = 'approved') approved_count, sum(if(state = 'approved', amount, 0)) approved_amount 
FROM Transactions
group by date_format(trans_date, '%Y-%m'), country) a
RIGHT OUTER JOIN 
(SELECT date_format(c.trans_date, '%Y-%m') month, t.country,
count(c.trans_id) chargeback_count , sum(t.amount) chargeback_amount
FROM Transactions t
right JOIN Chargebacks c
on t.id = c.trans_id
group by date_format(c.trans_date, '%Y-%m'), t.country) b
ON a.month = b.month

# Solution 2(reference)
SELECT date_format(TT.trans_date,'%Y-%m') AS 'month',
	country,SUM(state='approved') AS 'approved_count',
	SUM(IF(state='approved',amount,0)) AS 'approved_amount',
	SUM(state='charged') AS 'chargeback_count',
	SUM(IF(state='charged',amount,0)) AS 'chargeback_amount'
FROM
	(SELECT * FROM Transactions
	UNION ALL
	(SELECT trans_id,country,'charged' AS 'state',amount,C.trans_date
 	FROM Chargebacks C
 	LEFT JOIN Transactions T
 	ON C.trans_id = T.id)) AS TT #total
GROUP BY date_format(TT.trans_date,'%Y-%m'),TT.country
HAVING SUM(state='approved')>0 or SUM(state='charged')>0
