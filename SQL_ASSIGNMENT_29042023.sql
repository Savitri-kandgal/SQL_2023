create database assignment_2904;

-- 1. create table serviceStation
create table serviceStation(srNo int primary key,
serviceType varchar(30));

INSERT INTO servicestation VALUES (101,'Tire Rotation'), (102,'Coolant top-up'), (103,'Brake fluid Exchange'),
(104,'Wheel alignment'), (105,'Oil & filter change'), (106,'Car wash'), (107,'Replace windshield wipers'),
(108,'Engine oil replacement'), (109,'AC service'), (110,'Battery testing'), (111,'mirror service');

-- 2. create table customerRecords
create table customerrecords(
srNo int primary key,
carBrand varchar(20),
customerName varchar(20),
customerNumber int,
carIssue varchar(30),
receivedDate date,
returnedDate date,
maintenanceDays int,
mechanicName varchar(20),
mechanicPhone long,
cost decimal(10, 0),
serviceTypeId int, 
foreign key(serviceTypeId) references serviceStation(srNo));

-- 3. insert 30 records in customerRecords for 3 diffrent months (10 for each month)
INSERT INTO customerrecords VALUES 
(1,'Toyoto','Anusha',501,'Coated with dirt','2023-03-20','2023-03-24',180,'Siddu','9020935432',3000,106),
(2,'Honda','Nithya',502,'Wiper blades damaged','2023-03-02','2023-03-04',365,'Shankar','8808765431',2500,107),
(3,'BMW','Siddu',503,'Engine is not started','2023-03-01','2023-03-05',120,'Akash','9908765432',5000,108),
(4,'kia','Ankita',504,'Reduced engine performance','2023-03-13','2023-03-17',90,'Samrud','9908765433',4000,105),
(5,'Benz','Savitri',505,'Tire is not rotating','2023-03-08','2023-03-10',150,'Rakesh','7808765434',5500,101),
(6,'Renault','Bhagya',506,'Dead/Discharged Battery','2023-03-09','2023-03-11',180,'Tarak','9908765450',3000,110),
(7,'Nissan','Ravi',507,'Wheel out of alignment','2023-03-01','2023-03-02',210,'Mohan','6908765490',2000,104),
(8,'Infiniti','Krishna',508,'Brake failed','2023-03-14','2023-03-18',240,'Yashwanth','7968765430',6000,103),
(9,'Jeep','Nihal',509,'Low AC cooling','2023-03-07','2023-03-09',150,'Balram','7708765432',7000,109),
(10,'Hyundai','Sathvik',510,'Engine Overheating','2023-03-01','2023-03-06',180,'Chandu','8708765420',9000,102),
(11,'Toyoto','Arpita',511,'Coated with dirt','2023-04-20','2023-04-24',180,'sathish','9020932432',3300,106),
(12,'Honda','Nayana',512,'Wiper blades damaged','2023-04-02','2023-04-04',365,'Bhuvan','8708765431',2500,107),
(13,'BMW','Sampath',513,'Engine is not started','2023-04-01','2023-04-05',120,'Mahesh','9908775432',5700,108),
(14,'kia','Amrutha',514,'Reduced engine performance','2023-04-13','2023-04-17',90,'Subhash','9508765433',4200,105),
(15,'Benz','Swathi',515,'Tire is not rotating','2023-04-08','2023-04-10',150,'Sanketh','7808865434',1900,101),
(16,'Renault','Bharathi',516,'Dead/Discharged Battery','2023-04-09','2023-04-11',180,'Dinesh','9938765450',8000,110),
(17,'Nissan','Sanvi',517,'Wheel out of alignment','2023-04-01','2023-04-02',210,'Dhananjay','6908762490',2600,104),
(18,'Infiniti','Prasad',518,'Brake failed','2023-04-14','2023-04-18',240,'Dudra','7968765030',6900,103),
(19,'Jeep','Madhu',519,'Low AC cooling','2023-04-07','2023-04-09',150,'Eshwar','7708765432',7400,109),
(20,'Hyundai','Kaveri',520,'Engine Overheating','2023-04-01','2023-04-06',180,'Arif','8728765420',8700,102),
(21,'Toyoto','Kavya',521,'Coated with dirt','2023-02-20','2023-02-24',180,'Kiran','9020935232',4500,106),
(22,'Honda','Uma',522,'Wiper blades damaged','2023-02-02','2023-02-04',365,'Pradeep','8208765431',2560,107),
(23,'BMW','Akul',523,'Engine is not started','2023-02-01','2023-02-05',120,'Praveen','9908265432',5300,108),
(24,'kia','Kushi',524,'Reduced engine performance','2023-02-13','2023-02-17',90,'Chandru','9208765433',4200,105),
(25,'Benz','Girish',525,'Tire is not rotating','2023-02-08','2023-02-10',150,'Mallesh','7808265434',1800,101),
(26,'Renault','Ningaraj',526,'Dead/Discharged Battery','2023-02-09','2023-02-11',180,'Karthik','8908765450',3700,110),
(27,'Nissan','Rekha',527,'Wheel out of alignment','2023-02-01','2023-02-02',210,'Nithin','6908365490',2900,104),
(28,'Infiniti','Soumya',528,'Brake failed','2023-02-14','2023-02-18',240,'Nikhil','7968745430',6200,103),
(29,'Jeep','Namratha',529,'Low AC cooling','2023-02-07','2023-02-09',150,'Akshay','7708765732',7600,109),
(30,'Hyundai','Akshara',530,'Engine Overheating','2023-02-01','2023-02-06',180,'Vishwa','7708765420',9700,102);

SELECT * FROM assignment_2904.servicestation;
SELECT * FROM assignment_2904.customerrecords;

-- 4. fetch top 1 record from customerRecords & increase its cost by 1000rs
update customerrecords set cost=cost+1000 where srNo in
(Select srNo from (select srNo from customerrecords order by srNo limit 1 )a);

-- 5. join both tables
select * from customerrecords as a left join servicestation as b on a.serviceTypeId=b.srNo order by a.srNo;

-- right join with null value in left table
select a.srNo, a.carIssue, b.srNo, b.serviceType from customerrecords as a right join servicestation as b 
on a.serviceTypeId=b.srNo order by a.srNo;

-- 6. count all records
select count(*) from customerrecords;

-- 7. find total cost in each month & for 3 months
select monthname(receivedDate) month, sum(cost) as total_cost from customerrecords 
group by month(receivedDate) order by month(receivedDate);

-- 8.find average cost in each month & for 3 months
select monthname(receivedDate) month, avg(cost) from customerrecords 
group by month(receivedDate) order by month(receivedDate);

-- 9. find customers whose name starts with a
select customerName from customerrecords where customerName like 'A%';

-- 10. find mechanic who worked most.
select mechanicName, cost from customerrecords where cost in(select max(cost) from customerrecords);

-- find lowest & highest cost from 3 months
select monthname(receivedDate) as month, min(cost) as lowest_cost, max(cost) as Highest_cost from customerrecords 
group by month(receivedDate) order by month(receivedDate);



