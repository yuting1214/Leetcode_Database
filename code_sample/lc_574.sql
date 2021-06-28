# Table
## 1. Candidate
CREATE TABLE Candidate
(
     id 	varchar(300),
     Name 	varchar(255)
);
INSERT INTO Candidate ( id , Name )
VALUES
    ('1', 'A'),
    ('2', 'B'),
    ('3', 'C'),
    ('4', 'D'),
    ('5', 'E');
    
# 2. Vote
CREATE TABLE Vote
(
     id 	varchar(300),
     CandidateId 	varchar(255)
);

INSERT INTO Vote ( id , CandidateId )
VALUES
    ('1', '2'),
    ('2', '4'),
    ('3', '3'),
    ('4', '2'),
    ('5', '5');

# Solution 1(self, correct)
SELECT 
  Name
FROM Candidate
WHERE id =
  (SELECT CandidateId
  FROM 
  (SELECT CandidateId, COUNT(id) vote_num
  FROM Vote
  GROUP BY CandidateId) Vote_table
  ORDER BY vote_num DESC
  LIMIT 1);

# Solution 2(reference, correct)
select name as 'Name'
from Candidate
join (select Candidateid
    from Vote
    group by Candidateid
    order by count(*) desc
    limit 1) as winner
where Candidate.id = winner.Candidateid
