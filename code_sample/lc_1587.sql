# Table
## 1. Users
CREATE TABLE Users
(
     account 	int,
     name 	varchar(300)
);

INSERT INTO Users ( account , name )
VALUES
    (900001, 'Alice'),
    (900002, 'Bob'),
    (900003, 'Charlie');

## 2. Transactions
CREATE TABLE Transactions
(
     trans_id 	int,
     account 	int,
     amount 	int,
     transacted_on 	date
);

INSERT INTO Transactions ( trans_id , account , amount , transacted_on )
VALUES
    (1, 900001, 7000, '2020-08-01'),
    (2, 900001, 7000, '2020-09-01'),
    (3, 900001, -3000, '2020-09-02'),
    (4, 900002, 1000, '2020-09-12'),
    (5, 900003, 6000, '2020-08-07'),
    (6, 900003, 6000, '2020-09-07'),
    (7, 900003, -4000, '2020-09-11');
    
# Solution 1(self, correct)
SELECT
  U.name,
  B.balance
FROM
(SELECT
  account,
  SUM(amount) AS balance
FROM Transactions
GROUP BY account
HAVING SUM(amount) > 10000) B
LEFT JOIN Users U
ON B.account =  U.account

SELECT u.name, SUM(t.amount) AS 'balance'
FROM Users u
LEFT JOIN Transactions t
ON u.account = t.account
GROUP BY t.account
HAVING balance > 10000
"""
