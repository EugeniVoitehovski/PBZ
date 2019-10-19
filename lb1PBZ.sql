SELECT * FROM teacher; -- 1

SELECT * FROM student_group  where speciality = "ЭВМ"; -- 2 

SELECT private_number, classroom_number 
from teacher_student_group where subject_number = "18П"; -- 3 

SELECT distinct subject.subject_number, subject.name_of_subject from subject
INNER JOIN teacher_student_group on teacher_student_group.subject_number = subject.subject_number
INNER JOIN teacher on teacher.private_number = teacher_student_group.private_number
WHERE teacher.last_name = "Костин"; -- 4 

SELECT teacher_student_group.group_number from teacher_student_group 
INNER JOIN teacher on teacher_student_group.private_number = teacher.private_number
where last_name = "Фролов"; -- 5

SELECT * from subject where speciality = "АСОИ"; -- 6 

SELECT distinct teacher.* from teacher
inner join teacher_student_group on teacher.private_number = teacher_student_group.private_number
inner join student_group on teacher_student_group.group_number = student_group.group_number
where student_group.speciality = "АСОИ"; -- 7

SELECT DISTINCT last_name FROM teacher 
INNER JOIN teacher_student_group on teacher.private_number = teacher_student_group.private_number
 WHERE classroom_number = "210"; -- 8 
 
SELECT DISTINCT subject.name_of_subject, student_group.group_name FROM teacher_student_group 
INNER JOIN subject on teacher_student_group.subject_number = subject.subject_number
INNER JOIN student_group on teacher_student_group.group_number = student_group.group_number 
WHERE classroom_number BETWEEN "100" AND "200"; -- 9 

SELECT s1.group_number, s.group_number from student_group s1
INNER JOIN student_group s on s1.speciality=s.speciality
AND s1.group_number!=s.group_number; -- 10

SELECT sum(total_of_students) FROM student_group WHERE speciality = "ЭВМ"; -- 11

SELECT DISTINCT private_number FROM teacher_student_group 
INNER JOIN student_group on teacher_student_group.group_number = student_group.group_number 
WHERE speciality = "ЭВМ"; -- 12

SELECT DISTINCT subject_number FROM teacher_student_group; -- 13

SELECT distinct last_name FROM teacher_student_group 
inner join teacher on teacher_student_group.private_number = teacher.private_number
where (teacher_student_group.subject_number = "14П" or teacher_student_group.subject_number = "17П")
and teacher_student_group.private_number != "221Л"; -- 14


SELECT DISTINCT subject.* FROM subject
INNER JOIN teacher_student_group on private_number = teacher_student_group.private_number
WHERE teacher_student_group.private_number != "221П"; -- 15


SELECT DISTINCT subject.* FROM teacher_student_group
INNER JOIN subject on teacher_student_group.subject_number = subject.subject_number
inner join student_group on teacher_student_group.group_number = student_group.group_number
where teacher_student_group.subject_number not in (select subject_number from teacher_student_group 
inner join student_group on teacher_student_group.group_number = student_group.group_number
WHERE student_group.group_name = "М-6"); -- 16

SELECT teacher.* from teacher
where position = "Доцент" and teacher.private_number in (select private_number from teacher_student_group where group_number = "3Г")
and teacher.private_number in (select private_number from teacher_student_group where group_number = "8Г"); -- 17
  
SELECT teacher_student_group.subject_number, teacher_student_group.group_number, teacher_student_group.private_number FROM teacher_student_group
inner join teacher on teacher_student_group.private_number = teacher.private_number  
WHERE department = "ЭВМ" AND speciality like "%АСОИ%"; -- 18

SELECT DISTINCT teacher_student_group.group_number FROM teacher_student_group
INNER JOIN student_group on teacher_student_group.group_number = student_group.group_number
INNER JOIN teacher on teacher_student_group.private_number = teacher.private_number
WHERE teacher.speciality = student_group.speciality; -- 19

SELECT DISTINCT teacher.private_number FROM teacher_student_group
INNER JOIN teacher on teacher_student_group.private_number = teacher.private_number
INNER JOIN student_group on teacher_student_group.group_number = student_group.group_number
inner join subject on teacher_student_group.subject_number = subject.subject_number
WHERE teacher.department = "ЭВМ" AND student_group.speciality = subject.speciality; -- 20

SELECT DISTINCT student_group.speciality FROM teacher_student_group
INNER JOIN student_group on teacher_student_group.group_number = student_group.group_number
INNER JOIN teacher on teacher_student_group.private_number = teacher.private_number
WHERE department = "АСУ"; -- 21

SELECT subject_number FROM teacher_student_group
INNER JOIN student_group  on teacher_student_group.group_number = student_group.group_number
WHERE group_name = "АС-8"; -- 22

SELECT DISTINCT group_number FROM teacher_student_group
WHERE teacher_student_group.group_number IN 
(SELECT teacher_student_group.group_number FROM teacher_student_group
INNER JOIN student_group ON student_group.group_number = teacher_student_group.group_number
WHERE student_group.group_name = "АС-8"); -- 23

SELECT DISTINCT teacher_student_group.group_number FROM teacher_student_group
WHERE teacher_student_group.group_number Not IN 
(SELECT teacher_student_group.group_number FROM teacher_student_group
INNER JOIN student_group ON student_group.group_number = teacher_student_group.group_number
WHERE student_group.group_name = "АС-8"); -- 24

SELECT DISTINCT teacher_student_group.group_number
FROM teacher_student_group WHERE teacher_student_group.group_number NOT IN
(SELECT teacher_student_group.group_number FROM teacher_student_group
WHERE teacher_student_group.private_number = "430Л"); -- 25

SELECT DISTINCT teacher_student_group.private_number FROM teacher_student_group
WHERE teacher_student_group.subject_number != "12П" 
AND teacher_student_group.group_number = (SELECT student_group.group_number FROM student_group
WHERE student_group.group_name = "Э-15"); -- 26


