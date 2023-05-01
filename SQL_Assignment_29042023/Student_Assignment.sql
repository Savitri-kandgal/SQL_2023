-- table creation 
create table student(
StdID int,
StdName varchar(30) not null,
Sex varchar(6),
Percentage double,
StdClass int,
Section char,
Stream char(10),
DOB Date, 
primary key(StdID));

insert into student values(1, 'Anjali', 'Female', 98.10, 12, 'A', 'Arts', "2006-06-26");

-- records
insert into student values
(2, 'Eshwari', 'Female', 50.00, 11, 'C', 'Science', "2005-10-16"),
(3, 'Ramesh', 'Male', 70.50, 10, 'B', 'Commerce', "2004-02-18"),
(4, 'Sanvika', 'Female', 90.50, 12, 'D', 'Arts', "2007-05-25"),
(5, 'Nakshatra', 'Female', 60.00, 12, 'A', 'Commerce', "2005-12-16"),
(6, 'Nihal', 'Male', 40.50, 11, 'D', 'Arts', "2006-11-20"),
(7, 'Bharati', 'Female', 40.15, 10, 'B', 'Science', "2007-08-05"),
(8, 'Bhagya', 'Female', 55.00, 11, 'C', 'Science', "2003-07-19"),
(9, 'Ravi', 'Male', 68.50, 12, 'A', 'Commerce', "2002-10-16"),
(10, 'Krishna', 'Male', 45.10, 10, 'B', 'Arts', "2001-12-17"),
(11, 'Ankita', 'Female', 99.00, 11, 'C', 'Science', "2009-07-29"),
(12, 'Deepika', 'Female', 85.50, 11, 'D', 'Arts', "2007-10-16"),
(13, 'Lakshmi', 'Female', 50.10, 12, 'A', 'Commerce', "2002-04-27"),
(14, 'Nagesh', 'Male', 80.00, 11, 'C', 'Science', "2006-12-30"),
(15, 'Santhosh', 'Male', 40.50, 10, 'B', 'Commerce', "2005-11-16"),
(16, 'Kavana', 'Female', 98.10, 12, 'A', 'Arts', "2002-08-28"),
(17, 'Janhavi', 'Female', 57.00, 11, 'C', 'Science', "2003-12-19"),
(18, 'Vishwa', 'Male', 70.50, 10, 'B', 'Commerce', "2005-01-16"),
(19, 'Akshay', 'Male', 98.10, 12, 'A', 'Arts', "2003-11-16"),
(20, 'Manjula', 'Female', 80.00, 11, 'C', 'Science', "2004-06-20");


select count(*) from student; 			-- count

-- to print all record
select * from student;

-- to display only name and DOB
select StdName, DOB from student;

-- Percentage >='80.00'
select * from student where Percentage>='80.00';

-- name, stream, prct : Percentage>80
select StdName, Stream, Percentage from student where Percentage>80;

-- All records of : Stream='Science' and Percentage>75
select * from student where Stream='Science' and Percentage>75;

-- add column : age
alter table student add column age int;

-- rename column age to studentWeight
alter table student rename COLUMN age to studentWeight;

-- studentWeight from int to DECIMAL format
alter table student modify column studentWeight decimal(20,3);

insert into student values(21, 'Sahana', 'Female', 93, '12', 'C', 'Arts', '2007-05-01', 52.500); 
insert into student(StdID, StdName) values(22, 'Sampath');

/*
SET SQL_SAFE_UPDATES = 0;
UPDATE student
SET studentWeight = 60.300
WHERE studentWeight IS NULL;
SET SQL_SAFE_UPDATES = 1;*/

-- Added NOT NULL constraint
alter table student modify studentWeight decimal(20,3) not null;

insert into student(StdID, StdName) values(22, 'Sampath');  -- will get an error since studentWeight should not be null

-- dropped NOT NULL constraint
alter table student modify studentWeight decimal(20,3);

insert into student(StdID, StdName) values(23, 'Sudha');

update student set StdName='Gouri' where StdID=23; -- this will replace the value of stdname to 'Goudi' where & all stdID is 23
update student set StdName='Amrutha' where StdID=23 AND StdI ; 

delete from student where studentWeight=52.500;

select min(Percentage) from student;
select min(Percentage) from student where StdClass=11;

select max(Percentage) from student;
select max(Percentage) from student where StdClass=10;

select avg(Percentage) from student;
select avg(Percentage) from student where StdClass=12;

select sum(Percentage) from student;
select sum(Percentage) from student where StdClass=12;




