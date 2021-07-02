CREATE TABLE request_accepted
(
     requester_id 	varchar(300),
     accepter_id 	varchar(300),
     accept_date 	varchar(255)
);

INSERT INTO request_accepted ( requester_id , accepter_id , accept_date )
VALUES
    ('1', '2', '2016_06-03'),
    ('1', '3', '2016-06-08'),
    ('2', '3', '2016-06-08'),
    ('3', '4', '2016-06-09');

# Solution 1(self,correct)
SELECT merge_table.requester_id AS id, COUNT(merge_table.accepter_id) AS num     
FROM  
(SELECT requester_id, accepter_id FROM request_accepted r1
UNION ALL
SELECT accepter_id AS requester_id, requester_id AS accepter_id FROM request_accepted r2) merge_table
GROUP BY merge_table.requester_id
ORDER BY num DESC
LIMIT 1;
