create table sailor(
SID int primary key,
SName varchar(20),
Rating int,
Age real);

insert into sailor values
(22,'Dustin',7,45),
(29,'Brutus',1,33),
(31,'Lubber',8,55.5),
(32,'Andy',8,25.5),
(58,'Rusty',10,35),
(64,'Horataio',7,35),
(71,'Zorba',10,16),
(74,'Horatatio',9,35),
(85,'Art',3,25.5),
(95,'Bob',3,63.5);

Select*from sailor

create table boats(
BID int primary key,
BName varchar(20),
Color varchar(10));

insert into boats values
(101,'Interlake','blue'),
(102,'Interlake','red'),
(103,'Clipper','green'),
(104,'Marine','red');

select*from boats

create table reserve(
SID int foreign key references sailor(SID),
BID int foreign key references boats(BID),
Day Date);

insert into reserve values
(22,101,'1998-OCT-10'),
(22,102,'1998-OCT-10'),
(22,103,'1998-OCT-08'),
(22,104,'1998-OCT-07'),
(31,102,'1998-NOV-01'),
(31,103,'1998-NOV-06'),
(31,104,'1998-NOV-12'),
(64,101,'1998-SEP-05'),
(64,102,'1998-SEP-08'),
(74,103,'1998-SEP-08');

select*from reserve

select SName as name,age from sailor;
select*from sailor where Rating>8;
select SName as "name" from sailor where Rating>7 and age>25;
select BName as name,Color from boats;
select*from boats where Color='red';
select*from sailor S,reserve R where S.SID=R.SID and R.BID=103;
select distinct S.SName from sailor S,reserve R, boats B where S.SID=R.SID and R.BID=B.BID and B.Color='red';
select B.Color from sailor S,reserve R,boats B where S.SID=R.SID and R.BID=B.BID and SName='Lubber';
select S.Sname from sailor S,reserve R where S.SID=R.SID;
select S.Sname from sailor S where S.SID in(select S.SID from sailor S,reserve R,boats B where S.SID=R.SID and B.BID=R.BID group by S.SID having count (B.BID)>1);

select count(SID) from sailor;
select count(distinct BID) from reserve;
select count(BID) from boats;

select sum(Rating) from sailor;
select sum(distinct Age) from sailor;

select avg(distinct Age) from sailor;
select max(Age) from sailor;
select min(Age) from sailor;

select*from sailor order by SName;
select*from sailor order by SName desc;
select*from sailor order by Rating desc;
select*from sailor order by Age;
select*from sailor order by Rating,Age;
select*from sailor order by Rating,Age;

select Rating,min(Age) from sailor group by Rating;

select Rating,min(Age) from sailor where age>=21 group by Rating having count(*)>=2;
select B.BID,count(*) as "Reservations" from boats B,reserve R where B.BID=R.BID and B.Color='red' group by B.BID;
select Rating,avg(Age) from sailor group by Rating having count(*)>1;
select s.Rating,avg(s.Age) as avgAge from sailor  s where s.Age=(select min(Age) from sailor) group by s.Rating;