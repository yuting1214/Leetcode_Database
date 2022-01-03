# Data
CREATE TABLE Queue
(
    person_id	varchar(300),
    person_name	varchar(300),
    weight	integer,
    turn	integer
);

INSERT INTO Queue (person_id,person_name,weight,turn)
VALUES
    ('5', 'George Washington', 250, 1),
    ('3', 'John Adams', 350, 2),
    ('6', 'Thomas Jefferson', 400, 3),
    ('2', 'Will Johnliams', 200, 4),
    ('4', 'Thomas Jefferson', 175, 5),
    ('1', 'James Elephant', 500, 6);
    
# Solution 1(self)
select cum.person_name
FROM
(SELECT person_id, person_name,
    SUM(weight) OVER (ORDER BY turn) as Cum_weight
FROM Queue) cum
WHERE (1000 - cum.Cum_weight) >= 0 
ORDER BY cum.Cum_weight DESC
LIMIT 1;

# Solution 2(reference, subquery)
select person_name 
from queue a
where (select sum(weight) 
       from queue 
       where a.turn >= turn) <= 1000
order by turn desc 
limit 1
