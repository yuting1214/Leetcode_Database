# Solution 1 (self, correct)

SELECT
  ad_id,
  IFNULL(ROUND(100 * SUM(action = 'Clicked') / (SUM(action = 'Clicked') + SUM(action = 'Viewed')), 2), 0) AS ctr 
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC;
