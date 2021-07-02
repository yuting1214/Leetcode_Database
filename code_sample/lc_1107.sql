# Table
CREATE TABLE Traffic
(
     user_id 	varchar(300),
     activity 	varchar(300),
     activity_date 	date
);

INSERT INTO Traffic ( user_id , activity , activity_date )
VALUES
    ('1', 'login', '2019-05-01'),
    ('1', 'homepage', '2019-05-01'),
    ('1', 'logout', '2019-05-01'),
    ('2', 'login', '2019-06-21'),
    ('2', 'logout', '2019-06-21'),
    ('3', 'login', '2019-01-01'),
    ('3', 'jobs', '2019-01-01'),
    ('3', 'logout', '2019-01-01'),
    ('4', 'login', '2019-06-21'),
    ('4', 'groups', '2019-06-21'),
    ('4', 'logout', '2019-06-21'),
    ('5', 'login', '2019-03-01'),
    ('5', 'logout', '2019-03-01'),
    ('5', 'login', '2019-06-21'),
    ('5', 'logout', '2019-06-21');
    
# Solution 1(self, correct)    
SELECT
  activity_date,
  COUNT(DISTINCT user_id) AS user_count 
FROM Traffic
WHERE
(user_id, activity_date) IN
(SELECT
  user_id,
  MIN(activity_date)
FROM Traffic
WHERE activity = 'login'
GROUP BY user_id)
AND activity_date BETWEEN DATE_SUB('2019-06-30', INTERVAL 90 DAY) AND '2019-06-30'
GROUP BY activity_date

# Solution 2(reference, correct)
SELECT first_login.login_date, COUNT(DISTINCT first_login.user_id) AS "user_count"
FROM (
    SELECT t.user_id, MIN(t.activity_date) AS "login_date"
    FROM Traffic t
    WHERE t.activity = "login"
    GROUP BY t.user_id) first_login
WHERE first_login.login_date BETWEEN DATE_SUB("2019-06-30", INTERVAL 90 DAY) 
AND "2019-06-30"
GROUP BY first_login.login_date
