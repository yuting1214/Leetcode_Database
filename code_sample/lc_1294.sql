

# Solution 1 (self, correct)
SELECT Result.country_name, Result.weather_type
FROM
(SELECT
  country_id, 
  CASE 
  WHEN AVG(weather_state) <= 15
  THEN 'Cold'
  WHEN AVG(weather_state) < 25
  THEN 'Hot'
  ELSE 'Warm'
  END weather_type 
FROM Weather 
WHERE day = EXTRACT (YEAR_MONTH FROM day) = '200911'
GROUP BY country_id) Result
LEFT JOIN Countries 
ON Result.country_id = Countries.country_id 
