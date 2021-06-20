# Solution 1
DELETE FROM Person
WHERE Id IN
(select id from
(SELECT P1.Id FROM Person AS P1, Person AS P2
WHERE P1.Id > P2.Id AND P1.Email = P2.Email) t )

# Solution 2
delete p1 
from Person p1, Person p2
where p1.Email = p2.Email and p1.Id > p2.Id
