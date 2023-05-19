-- 1.Search for students information with higher grades in " 01 " courses than in " 02 " courses and their course marks
select * from student
where SId in (
    select t1.SId
    from (select * from sc where CId = '01')t1,
         (select * from sc where CId = '02')t2
    where t1.sid = t2.sid and t1.score>t2.score);

-- 2.Search for student numbers and student names and averages for students with a grade point average greater than or equal to 60
--  1st method:
select SId,Sname
from
    (select s.SId,s.Sname,avg(score) avg_sc
    from student s join sc on s.SId = sc.SId
    group by SId, Sname) t1
where avg_sc >= 60;
-- 2nd method
select s.SId,s.Sname
from student s left join sc on s.SId = sc.SId
group by s.SId, s.Sname
having avg(score) >= 60;

-- 3.Search for students with grades in the SC table
select * from student
where SId in (select distinct SId from sc)

-- 4.Search for all students' student numbers, student names, total number of courses taken, and the total number of grades for all courses
select s.SId,s.Sname,ifnull(count(cid),0) total_cos,ifnull(sum(score),0) total_score
from student s left join sc s2 on s.SId = s2.SId
group by s.SId, s.Sname

-- 4.Show students who have not selected a course (displayed as NULL)
select s.SId,s.Sname
from student s left join sc on s.SId= sc.SId
where CId is null

-- 5. Search for the number of teachers with the surname 'Li'
select Tname from teacher where Tname like 'Li%' ;

-- 6.Search for information on students who have taken classes taught by "Zhang San"
-- Method 1:
select * from student where SId in (
    select SId from sc where CId in (
        select cid from course where TId in (
            select TId from teacher where Tname = "Zhang San")));
-- Method 2:
select s.SId,Sname,Sage,Ssex
from student s left join sc on s.SId = sc.SId
               left join course c on sc.CId = c.CId
               left join teacher t on c.TId = t.TId
where Tname = 'Zhang San';
-- Method 3:
select s.SId,Sname,Sage,Ssex from student s ,sc,course c ,teacher t
where s.SId= sc.SId and sc.CId = c.CId and c.TId = t.Tid and Tname = 'Zhang San';

-- 7. Search for information on students who have not taken all the courses
-- Method 1:
select SId,Sname,Sage,Ssex
from student where sid not in
    (select sid from sc group by sid having count(*) =
        (select count(*) from course))
-- Method 2:
select s.SId,Sname,Sage,Ssex
from (select sid,count(1) course_num from sc group by sid) t1,
     (select count(*) course_num from course) t2,
     student s
where t1.course_num = t2.course_num and s.SId = t1.SId

-- 8.Search for information on students who have taken at least
-- one course that is the same as the one taken by the student with the " 01 " SId
-- Method 1 :
select * from student where SId in (
    select distinct sid from sc where cid in (
        select cid from sc where SId = '01'
    )and SId != '01') ;
-- Method 2:
select *
from student s,
     (select distinct sid from sc where cid in (
        select cid from sc where SId = '01')and SId != '01')  t1
where s.SId = t1.SId

-- 9. Search for other students who are studying the exact same course as the student with "01"
select s.SId,Sname,Sage,Ssex
from (select group_concat(CId order by CId) c1 from sc where SId = '01') t1,
     (select SId,group_concat(CId order by CId) c2 from sc where SId != '01' group by SId) t2,
     student s
where t1.c1 = t2.c2 and t2.SId= s.SId;

-- 10. Search for the names of students who have not taken any of the courses taught by "Zhang San".
select SId,Sname,Sage,Ssex
from student where SId not in
    (select distinct SId from sc where cid =
        (select cid from course where cid = (select tid from teacher where Tname = 'Zhang San')))

-- 11.Search for the student number, name and grade point average of students who have failed two or more courses
-- Method 1:
select s.SId,Sname
from student s,(select sid,count(score), avg(score) from sc where score <60 group by sid) t1
where s.SId = t1.SId
group by s.SId, Sname;


