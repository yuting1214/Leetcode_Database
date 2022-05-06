# Table
CREATE TABLE Friendship 
(
    user1_id	varchar(300),
    user2_id	varchar(300)
);

INSERT INTO Friendship (user1_id,user2_id)
VALUES
    ('1', '2'),
    ('1', '3'),
    ('1', '4'),
    ('2', '3'),
    ('2', '4'),
    ('2', '5'),
    ('6', '1');

CREATE TABLE Likes 
(
    user_id	varchar(300),
    page_id	varchar(300)
);

INSERT INTO Likes (user_id,page_id)
VALUES
    ('1', '88'),
    ('2', '23'),
    ('3', '24'),
    ('4', '56'),
    ('5', '11'),
    ('6', '33'),
    ('2', '77'),
    ('3', '77'),
    ('6', '88');

# Solution 1(reference, correct)
select distinct l.page_id as recommended_page
from Likes l
left join Friendship f1
on f1.user2_id = l.user_id
left join Friendship f2
on f2.user1_id = l.user_id
where (f1.user1_id = 1 or f2.user2_id = 1) and 
    l.page_id not in 
        (select page_id 
         from Likes 
         where user_id = 1)
    
