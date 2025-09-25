create database nwl;
use nwl;
create table person(
driver_id varchar(10),
name varchar(30),
address varchar(50),
primary key(driver_id));
desc person;

create table car(
reg_num varchar(10),
model varchar(15),
year date,
primary key(reg_num));
desc car;

create table accident(
report_num int,
accident_date date,
location varchar(20),
primary key(report_num));
desc accident;

create table owns(
driver_id varchar(10),
reg_num varchar(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));
desc owns;

create table participated(
driver_id varchar(10),
reg_num varchar(10),
report_num int,
damage_amount int,
primary key(driver_id, reg_num, report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
desc participated;

insert into person values(driver_id,name,address),
('A01','Richard','srinivas'),
('A02','Pradeep','rr nagar'),
('A03','smith','btm'),
('A04','Veni','hsr'),
('A05','john','bsk');

select * from person;

alter table car modify year int;

insert into car values
('KA052250','Indica',1990),
('KA031181','Lancer',1957),
('KA095477','Toyota',1999),
('KA041702','Honda',1998),
('KA053408','Audi',1989);

select * from car;

insert into accident values
('11','2003-01-01','Mysore Road'),
('12','2004-02-02','Southend Circle'),
('13','2003-01-21','Bulltemple Road'),
('14','2008-02-08','Southend Circle'),
('15','2005-03-21','Bulltemple Road');

select * from accident;


insert into owns valuess
('A01','KA052250'),
('A02','KA053408'),
('A03','KA031181'),
('A04','KA095477'),
('A05','KA041702');

select * from owns;

INSERT INTO participated VALUES 
  ('A01', 'KA052250', 11, 10000),
  ('A02', 'KA053408', 12, 50000),
  ('A03', 'KA095477', 13, 25000),
  ('A04', 'KA031181', 14, 3000),
  ('A05', 'KA041702', 15, 5000);
  
  select * from participated;



