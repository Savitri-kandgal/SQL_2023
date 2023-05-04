create table student1(id int primary key, name varchar(20), courseId_fk int, foreign key(courseId_fk) references course(id));

INSERT INTO student1 VALUES (1,'Savitri',2),(2,'Siddu', null), (3,'Ankita', 4),(4,'Deepika',1),(5, 'Laxmi', null), (6,'Bavya', 6);

create table course(id int primary key, facultyName varchar(20), courseName varchar(20));

insert into course value
(1, 'Omkar', 'Java'), (2, 'Shantanu', 'SQL'), (3, 'Akshara', null), (4, 'Vinodha', 'JDBC'), (5, 'Suhas', null), (6, 'Lokesh', 'WEB');

SELECT * FROM db6.course;
select * from student1;

-- inner join
select * from student1 inner join course on student1.courseId_fk=course.id;

-- left join
select * from student1 left join course on student1.courseId_fk=course.id;

-- left join(intersection)
select * from student1 left join course on student1.courseId_fk=course.id where course.id is null;

-- right join 
select * from student1 right join course on student1.courseId_fk=course.id;

-- right join (intersection)
select * from student1 right join course on student1.courseId_fk=course.id where student1.courseId_fk is null;

-- not working
-- full join
select * from student1 full join course on student1.courseId_fk=course.id;

-- not working
-- full join(intersection)
select * from student1 full join course on student1.courseId_fk=course.id where student1.courseId_fk is null or course.courseName is null;

-- full join (working)
select * from student1 left join course on student1.courseId_fk=course.id
union
select * from student1 right join course on student1.courseId_fk=course.id; 

-- full join (intersection)
select * from student1 left join course on student1.courseId_fk=course.id where course.id is null
union
select * from student1 right join course on student1.courseId_fk=course.id where student1.courseId_fk is null;

