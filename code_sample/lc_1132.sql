# Table
## 1.Actions
CREATE TABLE Actions
(
     user_id 	varchar(300),
     post_id 	varchar(300),
     action_date 	DATE,
     action 	varchar(300),
     extra 	varchar(255)
);
INSERT INTO Actions ( user_id , post_id , action_date , action , extra )
VALUES
    ('1', '1', '2019-07-01', 'view', NULL),
    ('1', '1', '2019-07-01', 'like', NULL),
    ('1', '1', '2019-07-01', 'share', NULL),
    ('2', '2', '2019-07-04', 'view', NULL),
    ('2', '2', '2019-07-04', 'report', 'spam'),
    ('3', '4', '2019-07-04', 'view', NULL),
    ('3', '4', '2019-07-04', 'report', 'spam'),
    ('4', '3', '2019-07-02', 'view', NULL),
    ('4', '3', '2019-07-02', 'report', 'spam'),
    ('5', '2', '2019-07-03', 'view', NULL),
    ('5', '2', '2019-07-03', 'report', 'racism'),
    ('5', '5', '2019-07-03', 'view', NULL),
    ('5', '5', '2019-07-03', 'report', 'racism');
## 2. Removals  
CREATE TABLE Removals
(
     post_id 	varchar(300),
     remove_date 	date
);

INSERT INTO Removals ( post_id , remove_date )
VALUES
    ('2', '2019-07-20'),
    ('3', '2019-07-18');
    
# Solution 1(self, correct)    
SELECT ROUND(AVG(ratio) * 100, 2) AS average_daily_percent 
FROM 
  (SELECT COUNT(r.remove_date) / COUNT(*) AS ratio
  FROM Removals r
  Right JOIN
  (SELECT *
  FROM Actions
  WHERE extra = 'spam') s
  ON r.post_id = s.post_id
  GROUP BY s.action_date) percent
