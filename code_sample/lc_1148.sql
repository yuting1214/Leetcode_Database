# Solution 1 (self, correct)
SELECT DISTINCT O.author_id AS id
FROM Views O, Views N
WHERE O.author_id = N.viewer_id
ORDER BY id;

# Solution 2 (reference, weird)
select author_id as id
from Views
where author_id = viewer_id
group by id
order by id
