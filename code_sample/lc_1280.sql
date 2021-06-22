create table Students(student_id integer, student_name  varchar(10));
insert into Students(student_id, student_name) values(1, 'Alice');
insert into Students(student_id, student_name) values(2, 'Bob');
insert into Students(student_id, student_name) values(13, 'John');
insert into Students(student_id, student_name) values(6, 'Alex');

create table Subjects(subject_name varchar(15));
insert into Subjects(subject_name ) values('Math');
insert into Subjects(subject_name ) values('Physics');
insert into Subjects(subject_name ) values('Programming');


FROM
(SELECT Students.student_id, Subjects.subject_name 
FROM Students
CROSS JOIN Subjects) AS cross_table
LEFT JOIN Examinations E
ON cross_table.student_id = E.student_id 
AND cross_table.subject_name = E.subject_name  
