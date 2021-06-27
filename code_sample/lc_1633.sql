# Table
## 1. Users
CREATE TABLE Users
(
     user_id 	varchar(300),
     user_name 	varchar(255)
);
INSERT INTO Users ( user_id , user_name )
VALUES
    ('6', 'Alice'),
    ('2', 'Bob'),
    ('7', 'Alex');
    
## 2. Register
CREATE TABLE Register
(
     contest_id 	varchar(300),
     user_id 	varchar(255)
);
INSERT INTO Register ( contest_id , user_id )
VALUES
    ('215', '6'),
    ('209', '2'),
    ('208', '2'),
    ('210', '6'),
    ('208', '6'),
    ('209', '7'),
    ('209', '6'),
    ('215', '7'),
    ('208', '7'),
    ('210', '2'),
    ('207', '2'),
    ('210', '7');

# Solutoin 1(self, correct)
SELECT 
  Total.contest_id,
  ROUND(SUM(R.user_id is not NULL) / COUNT(Total.contest_id) * 100, 2) AS percentage 
FROM 
(SELECT 
  Contest.contest_id,
  U.user_id 
FROM Users U
CROSS JOIN (SELECT DISTINCT contest_id AS contest_id FROM Register) Contest) Total
LEFT JOIN Register R
ON Total.contest_id = R.contest_id AND
Total.user_id = R.user_id 
GROUP BY Total.contest_id
ORDER BY percentage DESC, contest_id;

# Solution 2(reference, correct)
select r.contest_id as contest_id, 
    round(100*count(distinct r.user_id)/count(distinct u.user_id), 2) as percentage
from Register r, Users u
group by r.contest_id
order by percentage desc, contest_id

# Solution 3(reference, correct)
SELECT r.contest_id, ROUND(COUNT(1) * 100 / (SELECT COUNT(user_id) FROM Users), 2) AS 'percentage'
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC
