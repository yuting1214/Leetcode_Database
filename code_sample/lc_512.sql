# Solution 1 (self)
SELECT 
	player_id, 
	device_id 
FROM Activity
GROUP BY player_id
HAVING  event_date = MIN(event_date);

# Solution 2 (reference)
select player_id, device_id
from Activity
where (player_id, event_date) in
    (select player_id, min(event_date)
    from Activity 
    group by player_id);
