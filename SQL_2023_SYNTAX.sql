create database database_name; 			-- creating db
drop database database_name; 			-- deleting db

create table table_name(
1_column datatype());			-- to create new table with 1 files - atleast we should hv 1 column in table

drop table table_name;  -- to delete table

create table tablename
as select col1, col2 from another_table;   -- To create new table by using fields from another table

select * from table_name;  -- it will select entire data from table and print

alter table table_name add col_name datatype(size);   -- to add additional colm to the table

alter table table_name drop column col_name;		-- to delete col from table

ALTER TABLE TABLE_NAME RENAME COLUMN COL_NAME TO COL_NAME; -- to change the col name

ALTER TABLE TABLE_NAME MODIFY COLUMN COL_NAME NEW_DATATYPE;  -- to change the data type of the variable

-- (--) to comment single line & /* *\ for multiple line

select col1, col2 from tablename; -- if we want data of some perticular col/s not all cols present in table

-- follow the camal case or _ between 2 words for variable name
sr_name;
srName;

-- insert row values for all cols
insert into table_name values(value for col1, col2 value, col3 value, ...);

-- if we want to pass value only for the perticular col - it will update value to the col and rest of the columns will be null
insert into table_name(col name/s) values(value for respective selected col/s);

-- we wl get error here since we are providing incorrect/vise versa datatype values
insert into table_name(col1(int), col2(varchar)) values(col2 value(varchar), col1 value(int));

-- assignment - 
put 10 unique record & try all queries 

SQL constrains 
1.UNIQUE 		-- this will make col value to be unique
create table table_name(
1_col datatype() UNIQUE, 2_col varchar(20));  -- We hv made col1 as unique so duplicate value should not be allowed for col1

2.NOT NULL  -- this will retrict col value which should not be null
Alter table table_name modify column col_name2 int not null; -- we hv retricted col to not null, the col value should not be null, we hv to provide some value

insert into tab_name(1); -- we hv not provided value for col2 so will get an error since col2 is set to not null

3.DEFAULT	-- This will help to set default value to the column, though we hv not given any value to that col still that col wl be updated with default value which was set
create table table_name(
1_col datatype() UNIQUE, 2_col varchar(20) NOT NULL, 3_col double DEFAULT 10.00);


5-foreign key

-- assignment 
RDBMS
which is easy to do the CRUD operation
create table and apply all 3 constraints for that table & try with date as default
check other type of db other than RDBMS

4.primary key - combination of unique & not null

create table tb_name(col1 int, col1 varchar(100), primary key(col1)); -- setting col1 as primary key while creating table
insert into tb_name values(col1 value, col2 value); -- (col1 should be unique & should not be null since its primary key)
alter table tb_name drop primary key; -- to delete primary key constraint of the col from table 
alter table t_nm add primary key(colName); -- to add primary key constraint to the col in table 

WHERE:
select * from tb_nm where place='plc_name'; -- which wl provide the rows where place is matching in the table

--------	WHERE with 'AND' operator: --------------
select * from tb_nm where place='plc_name' and reading=2;  -- provides all col data where matching place and reading
select col1, col2, col3 from tb_nm where place='plc_nm' and reading=2;  -- provide only row data of col1,2,3 where both place and reading data is matching
select * from tb_nm where place='bglr' and place='mumbai'; -- this wouldn't work since bth condition cant be match at the same row

----------WHERE with 'OR' operator:----------------
select * from tb_nm where place='bglr' or place='mumbai'; -- this woll work provide rows info of both bglr & mumbai
--  if we want to apply more than 1 condition for the same col_name then 'and' operator wl not work, should use 'or' operator

---------WHERE with NOT: ----------------------
select * from tb_nm where not place='value'; -- which wl give which is not matching the given value

----------WHERE with LIMIT:--------------------
select * from tb_nm where place='pl_name' limit 1/2/3; -- which wl first filter by the place name and privde the no. of rows as the limit set 
-- if we hv 5 rows where place is matching but if we put limit as 2 then it wl provide only first 2 rows of data

COUNT:
select count(*) from tb_name; -- to count how many number of rows we hv in table
select count(col_name) from tb_name; -- - to count how many number of rows we hv in table by perticular col name

DISTINCT
select distinct col_name from tb_nm; --  this will remove the duplicate values and provide the unique values of the perticual column


-- assignment:
practice all these above constraints

UPDATE: 	user to update/replace the value of the perticular column based the value provided in another column 
UPDATE TB_NM SET COL1='VALUE' WHERE COL2='VALUE';   -- this will update/replace the col1 value to so & so where col2 is with value so and so

-- with 'AND'
UPDATE TB_NM SET COL1='VALUE' WHERE COL2='VALUE' and COL3='VALUE'; -- this will change the col1 value to so & so where col2 is with value so and so
-- with 'OR'
UPDATE TB_NM SET COL1='VALUE' WHERE COL2='VALUE' or COL2='VALUE';  -- 'OR' will not work here since condition is with same col 
-- without WHERE condition 
UPDATE tb_nm SET col1='value';  -- this will update the value to all rows sine we hv not mentioned where condition

DELETE
DELETE FROM TB_NM WHERE COL='VALUE'; -- to delete the perticular col from table

DELETE FROM TB_NM; -- this wl delete all the data from table

MIN: min value
select min(col_nm) from tb_nm;
select min(col_nm) from tb_nm where col2='value'; -- with where

MAX: max value
select max(col1) from tb_nm;
select max(col1) from tb_nm where col2='value'; -- with where

AVG: avarage value
select AVG(col) from tb_nm; 			
select AVG(COL1) FROM TB_NM WHERE COL2='VALUE'; -- with where

SUM:
SELECT SUM(COL1) FROM TB_NM;
SELECT SUM(COL1) FROM TB_NM WHERE COL2='VALUE'; -- with where

LIMIT: - it wl return the limited no. of records 
select * from tb_nm limit number; (ex: number is 1/2/3)  

Auto_increment 
create table tb_nm (
col1 datatype auto_increment
col2 data_type,
col3 data_type,
primary key(col1));

 insert into tb_nm(col2, col3) values(col2 value, col3 value)  -- no need to provide col1 value since it will be incremented automatically
 
 alter table student change StdID StdID int(11) auto_increment; -- make col as auto_increment after creating table 
 
 assignment - 0419
show name who scored least % 
show name who scored max %
and try auto_increment 

-- substr
select ename from empl where substr(ename, 4, 1)='t';  --  

-- like
select ename from empl where ename like 'a%';  -- name which contains 'a' at 1st possition

-- 6. Write a query to display the name of employee whose name contains “A” as third alphabet?
select ename from empl where ename like '__a%'; -- one '_' wl considered as 1 letter

-- 7: Write a query to display the name of employee whose name contains “T” as last alphabet?
select ename from empl where ename like '%t';
select ename from empl where ename like 'a%a'; -- this wl find a name which starts & ends with 'a'  

-- 8. Write a query to display the name of employee whose name contains ”M” as First and “L” as third alphabet?
 select ename from empl where ename like 'm_l%';

-- if else condition
-- 9. Write a query to display details of employs with the text “Not given”, if commission is null?
select comm, case when comm is null then 'not given' else comm end as status from empl;

-- in 
select * from tb_nm where col1 in(value, value);
-- in with not
select * from tb_nm where col1 not in(value, value);

-- between : provide the value between the range
select ename, sal from empl where sal between 2500 and 4000; -- this 
-- between with not: provide the value not between the range
select ename, sal from empl where sal not between 2500 and 4000;

-- as : used for alias name
select col as new_name from tb_nm; -- alias name for single col
select * from tb_nm as new tb_nm; -- alias name for table
select col1 as new_name, col2 as new_nm from tb_nm; -- alias name for multiple cols

-- delete : to delete the perticular row 
delete from student where col='value'; 
delete from student; -- this wl also delete all data from table, but that is not meant to do that so should always use truncate

-- truncate : to delete all data from table, 0 rows wl be effected
truncate table tb_nm;

-- drop and truncate : we cant get the data back if we use drop and truncate
-- delete: we can get the data back after deleting but we need to write additional query i.e, rollback 

--  between for date
SELECT * FROM db6.student;
select * from student where DOB between '2006-06-26' and '2009-06-26';

--  between for names
select StdName from student where StdName between 'Anjali' and 'Kavana';

-- datetime, date, year 
create table employee1(id int, name varchar(50), DOB datetime, joinedDate date, joinedYear year);

-- check : to put condition for int values - not working
create table employee2(id int, name varchar(50), DOB datetime, joinedDate date, joinedYear year, check(id>=5 and name='suma'));
insert into employee2 values(1, 'suma', '2000-01-01 01:30:40', '2020-10-01', '2020'); 

create table employee4(age int, name varchar(50), DOB datetime, joinedDate date, joinedYear year, check(year>=2000));
insert into employee4 values(1, 'suma', '2000-01-01 01:30:40', '2020-10-01', '1999'); 


-- to get todays date & time
select current_timestamp() as current_date_time;

-- to get todays date
select current_date() as todaysDate;

-- to get the current user
select current_user() as currentUser;

-- to get current time
select current_time() as timenow;

-- applied current_timestamp
create table employee5(age int, name varchar(50), DOB datetime, joinedDate datetime default current_timestamp);
insert into employee5(age, name, DOB) values(20, 'suresh', '2000-01-01 01:30:40');




 