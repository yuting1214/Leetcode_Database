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
