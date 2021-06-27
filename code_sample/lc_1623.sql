# Table
CREATE TABLE SchoolA
(
     student_id 	varchar(300),
     student_name 	varchar(255)
);
INSERT INTO SchoolA ( student_id , student_name )
VALUES
    ('1', 'Alice'),
    ('2', 'Bob');
    
CREATE TABLE SchoolB
(
     student_id 	varchar(300),
     student_name 	varchar(255)
);
INSERT INTO SchoolB ( student_id , student_name )
VALUES
    ('3', 'Tom');
    
CREATE TABLE SchoolC
(
     student_id 	varchar(300),
     student_name 	varchar(255)
);
INSERT INTO SchoolC ( student_id , student_name )
VALUES
    ('3', 'Tom'),
    ('2', 'Jerry'),
    ('10', 'Alice');

# Solution 
SELECT
     A.student_name AS member_A,
     B.student_name AS member_B,
     C.student_name AS member_C
FROM SchoolA A ,SchoolB B, SchoolC C
WHERE 
  A.student_name != B.student_name AND
  A.student_name != C.student_name AND
  B.student_name != C.student_name AND
  A.student_id != B.student_id AND
  A.student_id != C.student_id AND  
  B.student_id != C.student_id 
