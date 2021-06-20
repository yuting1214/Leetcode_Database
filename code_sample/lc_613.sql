# Concept
# Self join

# Solution 1
select min(ABS(pre.x - cur.x)) distance
from Test pre, Test cur
where pre.x != cur.x
