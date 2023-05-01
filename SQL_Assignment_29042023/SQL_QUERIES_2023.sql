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














