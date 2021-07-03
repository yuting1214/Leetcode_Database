# Table
CREATE TABLE Enrollments
(
     student_id 	INT,
     course_id 	INT,
     grade 	INT
);

INSERT INTO Enrollments ( student_id , course_id , grade )
VALUES
    (2, 2, 95),
    (2, 3, 95),
    (1, 1, 90),
    (1, 2, 99),
    (3, 1, 80),
    (3, 2, 75),
    (3, 3, 82);

# Solution 1(self, correct)
SELECT student_id,course_id,grade
FROM Enrollments
WHERE (student_id, course_id) IN
(SELECT student_id, MIN(course_id)
FROM Enrollments
WHERE (student_id, grade) IN
(SELECT student_id, MAX(grade)
FROM Enrollments
GROUP BY student_id) 
GROUP BY student_id)
ORDER BY student_id;

# Soluton 2(self, correct)
select DISTINCT student_id, course_id, grade 
from 
(
  select *, dense_rank() over(PARTITION by student_id ORDER BY grade desc, course_id) rnk 
	from Enrollments
) t
where rnk=1
ORDER BY student_id
