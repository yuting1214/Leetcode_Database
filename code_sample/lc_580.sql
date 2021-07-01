# Table
## 1. student
CREATE TABLE student
(
     student_id 	integer,
     student_name 	varchar(300),
     gender 	varchar(300),
     dept_id 	integer
);
INSERT INTO student ( student_id , student_name , gender , dept_id )
VALUES
    (1, 'Jack', 'M', 1),
    (2, 'Jane', 'F', 1),
    (3, 'Mark', 'M', 2);
## 2. department
CREATE TABLE department
(
     dept_id 	integer,
     dept_name 	varchar(255)
);

INSERT INTO department ( dept_id , dept_name )
VALUES
    (1, 'Engineering'),
    (2, 'Science'),
    (3, 'Law');
    
# Solution 1(self, correct) 
SELECT
  department.dept_name,
  SUM(CASE WHEN student.student_id IS NOT NULL THEN 1 ELSE 0 END) AS student_number
FROM department
LEFT JOIN student 
ON department.dept_id = student.dept_id 
GROUP BY department.dept_name 
ORDER BY student_number DESC, dept_name;

# Solution 2(reference, correct)
SELECT d.dept_name, COUNT(DISTINCT s.student_id) AS "student_number"
FROM department d
LEFT JOIN student s
ON d.dept_id = s.dept_id
GROUP BY d.dept_name
ORDER BY student_number DESC, d.dept_name
