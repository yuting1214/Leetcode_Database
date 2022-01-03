# Data
CREATE TABLE Matches
(
    match_id	varchar(300),
    host_team	varchar(300),
    guest_team	varchar(300),
    host_goals	integer,
    guest_goals	integer
);

INSERT INTO Matches (match_id,host_team,guest_team,host_goals,guest_goals)
VALUES
    ('1', '10', '20', 3, 0),
    ('2', '30', '10', 2, 2),
    ('3', '10', '50', 5, 1),
    ('4', '20', '30', 1, 0),
    ('5', '50', '30', 1, 0);

# Solution 1 (self)
SELECT t.team_id, t.team_name, ifnull(P.num_points, 0) num_points
FROM Teams t
LEFT JOIN 
    (SELECT p.team_id, sum(p.num_points) num_points
    FROM
    (SELECT host_team AS team_id,
           CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
    END AS num_points
    FROM Matches
    Union ALL
    SELECT guest_team AS team_id,
           CASE
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
    END AS num_points
    FROM Matches) p
    GROUP BY p.team_id) P
ON t.team_id = P.team_id
ORDER BY num_points DESC, team_id ASC

# Solution 2(reference)
select t.team_id, t.team_name,
    ifnull(sum(case when t.team_id = m.host_team and m.host_goals > m.guest_goals then 3
    when t.team_id = m.host_team and m.host_goals = m.guest_goals then 1
    when t.team_id = m.guest_team and m.host_goals < m.guest_goals then 3
    when t.team_id = m.guest_team and m.host_goals = m.guest_goals then 1
    else 0 end), 0) as num_points
from Matches m
right join Teams t
on m.host_team = t.team_id or m.guest_team = t.team_id
group by team_id, team_name
order by num_points desc, team_id
