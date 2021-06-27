# Table
## 1. Users
CREATE TABLE Users
(
     user_id 	int,
     user_name 	varchar(300),
     credit 	int
);

INSERT INTO Users ( user_id , user_name , credit )
VALUES
    (1, 'Moustafa', 100),
    (2, 'Jonathan', 200),
    (3, 'Winston', 10000),
    (4, 'Luis', 800);

## 2. Transactions
CREATE TABLE Transactions
(
     trans_id 	int,
     paid_by 	int,
     paid_to 	int,
     amount 	int,
     transacted_on 	date
);

INSERT INTO Transactions ( trans_id , paid_by , paid_to , amount , transacted_on )
VALUES
    (1, 1, 3, 400, '2020-08-01'),
    (2, 3, 2, 500, '2020-08-02'),
    (3, 2, 1, 200, '2020-08-03');

# Solution 1(self, correct)
SELECT 
  user_id,
  user_name,
  balance,
  (CASE WHEN balance < 0 THEN "Yes" ELSE "No" END) AS credit_limit_breached 
FROM
(SELECT
  U.user_id,
  U.user_name,
  (CASE WHEN T1.paid_by IS NULL THEN 0 ELSE -T1.amount END) +
  (CASE WHEN T2.paid_to IS NULL THEN 0 ELSE T2.amount END) +
  U.credit AS balance
FROM Users U
LEFT JOIN Transactions T1
ON U.user_id = T1.paid_by
LEFT JOIN Transactions T2
ON U.user_id = T2.paid_to) B;

# Solution 2(reference, correct)
SELECT u2.user_id, u2.user_name, u2.credit + IFNULL(r.total_amount, 0) AS 'credit'
      ,CASE WHEN u2.credit + IFNULL(r.total_amount, 0) < 0 THEN 'Yes'
            ELSE 'No' END AS 'credit_limit_breached'
FROM Users u2
LEFT JOIN (
    SELECT u.user_id
          ,SUM(CASE WHEN t1.paid_by = u.user_id THEN -1 * t1.amount
                    ELSE t1.amount END) AS 'total_amount'
    FROM Users u
    LEFT JOIN Transactions t1
    ON t1.paid_by = u.user_id
    OR t1.paid_to = u.user_id
    GROUP BY u.user_id
    ) r
ON u2.user_id = r.user_id
