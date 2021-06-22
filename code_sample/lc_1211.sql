# Table
select query_name, 
    round(sum(rating/position)/count(query_name), 2) as quality,
    round(100*sum(if(rating < 3, 1, 0))/count(query_name), 2) as poor_query_percentage
from Queries
group by query_name

# Solution 1 (self, correct)
SELECT
  query_name,
  ROUND(AVG(rating / position), 2) AS quality,
  ROUND( 100 * AVG(rating < 3), 2) AS poor_query_percentage 
FROM Queries
GROUP BY query_name

# Solution 2(self, correct)
select query_name, 
    round(sum(rating/position)/count(query_name), 2) as quality,
    round(100*sum(if(rating < 3, 1, 0))/count(query_name), 2) as poor_query_percentage
from Queries
group by query_name
