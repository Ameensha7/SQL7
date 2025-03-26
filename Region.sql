create table jobs
(
Job_id int primary key,
Job_title Varchar(20),
Salary int);

insert into jobs values
(77,'Ameen',25000),
(78,'Athul',25000),
(79,'Jerin',25000),
(80,'Asna',20000),
(81,'Hana',20000);

select * from jobs;

create table region
(
Region_id int primary key,
Region_Name Varchar(30));

insert into region values
(47,'Kodungallur'),
(72,'Wayanad');

select * from region

create table countries
(
Country_id int primary key,
Country_name Varchar(20),
Region_id int foreign key references region(Region_id));

insert into countries values
(100,'INDIA',47),
(200,'AMERICA',72);

select * from countries

create table location
(
Location_id int primary key,
Street_address Varchar(20),
Postal_code int,
City Varchar(20),
State_province Varchar(20),
Country_id int foreign key references countries(Country_id));

insert into location values
(1001,'Eriyad',680666,'Thrissur','Kerala',100),
(1002,'Mananthavady',680667,'Wayanad','Kerala',200);

select * from location;

create table department(
department_id int primary key,
department_name varchar(10),
location_id int foreign key references location(location_id));

insert into department values
(777,'MCA',1001),
(778,'MTEC',1002),
(779,'BTEC',1001),
(780,'BCS',1002),
(781,'CS',1002);

select*from department

create table employee(
Employee_id int primary key,
First_name varchar(20),
Last_name varchar(20),
Email varchar(40),
Phone_Number varchar(25),
Hire_date date,
Job_id int foreign key references jobs(Job_id),
Salary int,
Manager_id int,
Department_id int foreign key references department(department_id));

insert into employee values
(101,'Ameen','Sha','alameen.aasps@gmail.com',9744029961,'2022-11-24',77,500000,501,777),
(102,'Athul','Raj','athul@gmail.com',9744649453,'2024-09-12',78,2000,502,778),
(103,'Jerin','Tom','jerintom@gmail.com',9548365836,'2023-01-29',79,2000,503,779),
(104,'Asna','RN','asnarn@gmail.com',9574857836,'2023-10-04',80,500,504,780),
(105,'Hana','Nasreen','hana@gmail.com',8735257836,'2024-06-17',81,500,505,781);

select*from employee

create table dependant(
Dependant_id int primary key,
First_name varchar(20),
Last_name varchar(20),
Relationship varchar(40),
Employee_id int foreign key references employee(employee_id));

insert into dependant values
(27,'Ameen','Sha','Single',101),
(28,'Athul','Raj','Single',102),
(29,'Jerin','Tom','Single',103),
(30,'Asna','RN','Commited',104),
(31,'Hana','Nasreen','Lesbian',105);

select*from dependant