# Solution 1 (self, wrong)
SELECT COUNT(DISTINCT requester_id, accepter_id))
FROM RequestAccepted
/ 
SELECT COUNT(DISTINCT( sender_id, send_to_id))
FROM FriendRequest 

# Solution 2 (reference, correct)
select round(
    ifnull(
    (select count(*) 
     from (select distinct requester_id, accepter_id 
           from RequestAccepted) as A)
    /
    (select count(*) 
     from (select distinct sender_id, send_to_id 
           from FriendRequest) as B),
    0)
, 2) as accept_rate;
