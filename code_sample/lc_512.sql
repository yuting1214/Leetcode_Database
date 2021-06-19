# Initial answer 
SELECT 
	player_id, 
	device_id 
FROM Activity
GROUP BY player_id
HAVING  event_date = MIN(event_date);

# Correct answer
select player_id, device_id
from Activity
where (player_id, event_date) in
    (select player_id, min(event_date)
    from Activity 
    group by player_id);
