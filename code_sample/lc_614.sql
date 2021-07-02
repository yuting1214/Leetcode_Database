# Solution 1(self, correct)
SELECT
  er.follower,
  COUNT(DISTINCT ee.followee) AS num
FROM follow er 
INNER JOIN follow ee
ON er.follower = ee.followee
GROUP BY er.follower
ORDER BY follower;
