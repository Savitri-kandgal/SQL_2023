create database db1;
drop table db1;

create table employee(name varchar(50));

drop table employee;

create table company(id int);
create table mobile(brand varchar(30));
create table student(weight double);
create table marks_details(Kannada float);

select * from db1.student;
-- ==============================================================================
create database db2;

create table employee(emp_id int, name varchar(50));
-- drop table employee;
create table company(name varchar(50), revenue double);

create table db2.mobile
as select brand, color 
from db3.mobile;

create table student(roll_no int)
as select name
from employee; 

create table db2.marks_details(english double)
as select Kannada 
from db1.marks_details;

-- ==========================================================================================
create database db3;
create table mobile(brand varchar(30), color varchar(20), size float);

create table db3.student
as select roll_no, name, weight from db1.student, db2.student; 

create table db3.employee
as select emp_id, name, salary
from db4.employee;

create table db3.company
as select id, name, revenue from db1.company, db2.company;

create table db3.marks_details(GK float)
as select kannada, social, english from db4.marks_details, db5.marks_details;

-- ==============================================================================
create database db4;

create table db4.employee(emp_id int, name varchar(50), salary double, transport_facility boolean);
drop table db4.employee;

create table db4.marks_details(social double)
as select hindi, science, maths from db5.marks_details;


-- ===============================================================================

create database db5;

create table db5.marks_details(hindi double, science float, maths double)
as select Kannada, english from db2.marks_details;

alter table db5.laptop add primary key(id);

alter table db5.laptop drop primary key;  -- not working, need to check 

select * from laptop where color='black'; 
select id, brand from laptop where service_location='Bangalore';
select * from laptop where color='black' and brand='dell';
select * from laptop where color='gray' or brand='dell';
select * from laptop where not color='gray' and not brand='dell';
select * from laptop limit 2;
select count(*) from laptop;
select count(id) from laptop;

select distinct service_location from laptop;

select * from student limit 3;

select * from student where NOT Percentage<70 ;

delete from student where StdName='Nagesh';

select min(Percentage) from student;

select max(Percentage) from student;

select count(studentWeight) from student;

select sum(Percentage) from student;

alter table student change StdID StdID int(11) auto_increment;

insert into student(StdName, Sex) values('Savita', 'Female');

-- in : it wl work like 'where with or
select * from empl where job in('SALESMAN', 'CLERK');

-- in : it wl work like 'not where with or
select * from empl where job not in('SALESMAN', 'CLERK');

-- between
select ename, sal from empl where sal between 2500 and 4000;

-- between with not
select ename, sal from empl where sal not between 2500 and 4000;

-- alias name for single column
select mgr as manager from empl;

-- alias name for table name
select * from empl as employees;

-- alias name for multiple cols 
select mgr as manager, sal as salary from empl;

SELECT * FROM db6.student;

-- delete : to delete the perticular row 
delete from laptop where ID='101';

-- truncate : to delete all data from table, 0 rows wl be effected
truncate table tb_nm;
truncate table db5.laptop;

--  between for date
SELECT * FROM db6.student;
select * from student where DOB between '2006-06-26' and '2009-06-26';

--  between for names
select StdName from student where StdName between 'Anjali' and 'Kavana';

-- datetime, date, year 
create table employee1(id int, name varchar(50), DOB datetime, joinedDate date, joinedYear year);

SELECT * FROM db6.employee1;
insert into employee1 values(1, 'suma', '2000-01-01 01:30:40', '2020-10-01', '2020'); 

drop table employee2;

-- check  - not working
create table employee2(id int, name varchar(50), DOB datetime, joinedDate date, joinedYear year, check(id>=5 and name='suma'));
insert into employee2 values(1, 'suma', '2000-01-01 01:30:40', '2020-10-01', '2020'); 

create table employee4(age int, name varchar(50), DOB datetime, joinedDate date, joinedYear year, check(year>=2000));
insert into employee4 values(1, 'suma', '2000-01-01 01:30:40', '2020-10-01', '1999'); 

drop table employee4;

-- to get todays date & time
select current_timestamp() as current_date_time;

-- to get todays date
select current_date() as todaysDate;

-- to get current time
select current_time() as timenow;

-- to get the current user
select current_user() as currentUser;

-- applied current_timestamp
create table employee5(age int, name varchar(50), DOB datetime, joinedDate datetime default current_timestamp);
insert into employee5(age, name, DOB) values(20, 'suresh', '2000-01-01 01:30:40');

select * from employee5;

-- foreign key
create table course(id int, facultyName varchar(20), courseName varchar(20), primary key(id));
insert into course values(1, 'Omkar', 'Java');
insert into course values(2, 'Shantanu', 'SQL');

create table student1(id int, name varchar(20), courseId_fk int, primary key(id), foreign key(courseId_fk) references course(id));
insert into student1 values(1, 'Savitri', 2);
insert into student1 values(2, 'Siddu', 1);

select * from student1 left join course on course.id=student1.courseId_fk;

