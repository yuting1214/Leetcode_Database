# Solution 1 (self, wrong)
SELECT ROUND(SUM(session_count) / COUNT(session_count), 2) AS average_sessions_per_user 
FROM 
(SELECT COUNT(session_id) AS  session_count
FROM Activity 
WHERE activity_date BETWEEN DATE_SUB('2019-07-27, INTERVAL '29 day')
GROUP BY user_id) as group_ ;

# Solution 2(reference, correct)
select round(ifnull(count(distinct session_id)/count(distinct user_id), 0),2) as average_sessions_per_user
from Activity 
where datediff('2019-07-27', activity_date) <= 29
