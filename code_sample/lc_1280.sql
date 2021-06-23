# Table
create table Students(student_id integer, student_name  varchar(10));
insert into Students(student_id, student_name) values(1, 'Alice');
insert into Students(student_id, student_name) values(2, 'Bob');
insert into Students(student_id, student_name) values(13, 'John');
insert into Students(student_id, student_name) values(6, 'Alex');

create table Subjects(subject_name varchar(15));
insert into Subjects(subject_name ) values('Math');
insert into Subjects(subject_name ) values('Physics');
insert into Subjects(subject_name ) values('Programming');

create table Examinations(student_id integer, subject_name varchar(15));
insert into Examinations(student_id, subject_name) values(1, 'Math');
insert into Examinations(student_id, subject_name) values(1, 'Physics');
insert into Examinations(student_id, subject_name) values(1, 'Programming');
insert into Examinations(student_id, subject_name) values(2, 'Programming');
insert into Examinations(student_id, subject_name) values(1, 'Physics');
insert into Examinations(student_id, subject_name) values(1, 'Math');
insert into Examinations(student_id, subject_name) values(13, 'Math');
insert into Examinations(student_id, subject_name) values(13, 'Programming');
insert into Examinations(student_id, subject_name) values(13, 'Physics');
insert into Examinations(student_id, subject_name) values(2, 'Math');
insert into Examinations(student_id, subject_name) values(1, 'Math');

# Solution
SELECT 
FROM

SELECT E.student_id, cross_table.student_id, cross_table.subject_name, SUM(E.subject_name IS NOT NULL)
FROM
(SELECT Students.student_name, Students.student_id, Subjects.subject_name 
FROM Students
CROSS JOIN Subjects) AS cross_table
LEFT JOIN Examinations E
ON cross_table.student_id = E.student_id 
AND cross_table.subject_name = E.subject_name  
GROUP BY E.student_id, cross_table.student_id, cross_table.subject_name

SELECT agg.student_id, agg.student_id, agg.subject_name, SUM(E.subject_name IS NOT NULL)
FROM
(SELECT Students.student_name, Students.student_id, Subjects.subject_name 
FROM Students
CROSS JOIN Subjects) AS cross_table
LEFT JOIN Examinations E
ON cross_table.student_id = E.student_id 
AND cross_table.subject_name = E.subject_name) agg 
GROUP BY agg.student_name, agg.student_id, agg.subject_name


JOIN student_name s
ON s.student_id
