# Solution 1 (self, wrong)
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

# Solution 3 (self, review)
SELECT a.player_id,	a.device_id
FROM Activity a
right JOIN
(SELECT player_id, Min(event_date) as event_date
FROM Activity
GROUP BY player_id) b
ON a.player_id = b.player_id AND a.event_date = b.event_date
