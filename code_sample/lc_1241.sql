# Table
create table Submissions(sub_id integer, parent_id integer);
insert into Submissions(sub_id, parent_id) values(1, NULL);
insert into Submissions(sub_id, parent_id) values(2, NULL);
insert into Submissions(sub_id, parent_id) values(1, NULL);
insert into Submissions(sub_id, parent_id) values(12, NULL);
insert into Submissions(sub_id, parent_id) values(3, 1);
insert into Submissions(sub_id, parent_id) values(5, 2);
insert into Submissions(sub_id, parent_id) values(3, 1);
insert into Submissions(sub_id, parent_id) values(4, 1);
insert into Submissions(sub_id, parent_id) values(9, 1);
insert into Submissions(sub_id, parent_id) values(10, 2);
insert into Submissions(sub_id, parent_id) values(6, 7);

# Solution 1(self, correct)
SELECT post.sub_id AS post_id, COUNT(DISTINCT comment.sub_id) AS number_of_comments
FROM
(SELECT DISTINCT sub_id
FROM Submissions
WHERE parent_id IS NULL) post 
LEFT JOIN 
(SELECT sub_id, parent_id  
FROM Submissions
WHERE parent_id IS NOT NULL) comment 
ON post.sub_id = comment.parent_id 
GROUP BY post.sub_id
ORDER BY post.sub_id;

# Solution 2(reference, correct)
select s1.sub_id as post_id,
    count(distinct s2.sub_id) as number_of_comments
from Submissions s1
left join Submissions s2
on s2.parent_id = s1.sub_id
where s1.parent_id is null
group by s1.sub_id
