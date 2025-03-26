create table employeetable
(
id int primary key,
Name Varchar(10),
Age int,
Gender char);
insert into employeetable values
(77,'Ameen',21,'M'),
(78,'Athul',26,'M'),
(79,'Jerin',28,'M'),
(80,'Asna',22,'F'),
(81,'Hana',16,'F');
Select*from employeetable
Select Gender from employeetable
select Name from employeetable where age>21
insert into employeetable values
(82,'Seena',30,'F');
select count(*) as total_employees from employeetable
select distinct Name from employeetable
select distinct Gender from employeetable
alter table employeetable add Salary int;
update employeetable set Salary=5000;
update employeetable set Salary=10000000 where id=77;
update employeetable set Salary=10 where Gender='F';
drop table employeetable