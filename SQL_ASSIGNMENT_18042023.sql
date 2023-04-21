SELECT * FROM db6.student;

select * from student limit 3;

select * from student where NOT Percentage<70 ;

delete from student where StdName='Nagesh';

select min(Percentage) from student;

select max(Percentage) from student;

select count(studentWeight) from student;

select sum(Percentage) from student;

alter table student add auto_increment(StdID);