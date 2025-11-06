CREATE DATABASE empdb;
USE empdb;

CREATE TABLE dept (
deptno decimal(2,0) primary key,
dname varchar(14) default NULL,
loc varchar(13) default NULL
);

CREATE TABLE emp (
empno decimal(4,0) primary key,
ename varchar(10) default NULL,
mgr_no decimal(4,0) default NULL,
hiredate date default NULL,
sal decimal(7,2) default NULL,
deptno decimal(2,0) references dept(deptno)
);

create table incentives (
empno decimal(4,0) references emp(empno),
incentive_date date,
incentive_amount decimal(10,2),
primary key(empno,incentive_date)
);

Create table project (
pno int primary key,
pname varchar(30) not null,
ploc varchar(30)
);

Create table assigned_to (
empno decimal(4,0) references emp(empno),
pno int references project(pno),
job_role varchar(30),
primary key(empno,pno)
);
show tables;

INSERT INTO dept VALUES
	(10, 'ACCOUNTING', 'MUMBAI'),
	(20, 'RESEARCH', 'BENGALURU'),
	(30, 'SALES', 'DELHI'),
	(40, 'OPERATIONS', 'CHENNAI');
select * from dept;

INSERT INTO emp VALUES 
	(1001, 'Adarsh', NULL, '2015-06-01', 75000.00, 10),
	(1002, 'Shruthi', 1001, '2016-08-15', 62000.00, 10),
	(1003, 'Tanvir', NULL, '2014-03-20', 88000.00, 20),
	(1004, 'Ramesh', 1003, '2017-11-05', 54000.00, 20),
	(1005, 'Anvitha', 1003, '2018-01-10', 58000.00, 20);
select * from emp;

INSERT INTO incentives VALUES 
	(1002, '2022-01-15', 5000.00),
	(1004, '2022-02-10', 3000.00),
	(1005, '2022-03-05', 4500.00),
	(1007, '2022-04-20', 2500.00),
	(1002, '2022-05-25', 6000.00);
select * from incentives;

INSERT INTO project VALUES 
	(101, 'AI Development', 'BENGALURU'),
	(102, 'IoT Integration', 'HYDERABAD'),
	(103, 'Blockchain Research', 'PUNE'),
	(104, 'Data Analytics', 'MYSURU'),
	(105, 'Autonomous Systems', 'CHENNAI');
select * from project;

INSERT INTO assigned_to VALUES 
	(1002, 101, 'Software Developer'),
	(1004, 102, 'Data Analyst'),
	(1005, 103, 'Backend Engineer'),
	(1007, 104, 'QA Tester'),
	(1001, 105, 'Project Manager');
select * from assigned_to;

SELECT a.empno
FROM assigned_to a
JOIN project p ON a.pno = p.pno
WHERE p.ploc IN ('BENGALURU', 'HYDERABAD', 'MYSURU');

SELECT empno
FROM emp
WHERE empno NOT IN (
    SELECT DISTINCT empno
    FROM incentives
);

SELECT
    e.ename AS EmployeeName,
    e.empno AS EmployeeNumber,
    d.dname AS DepartmentName,
    a.job_role AS JobRole,
    d.loc AS DepartmentLocation,
    p.ploc AS ProjectLocation
FROM emp e
JOIN dept d ON e.deptno = d.deptno
JOIN assigned_to a ON e.empno = a.empno
JOIN project p ON a.pno = p.pno
WHERE d.loc = p.ploc;

SELECT m.ename, count(*)
FROM emp e,emp m
WHERE e.mgr_no = m.empno
GROUP BY m.ename
HAVING count(*) =(SELECT MAX(mycount)
 from (SELECT COUNT(*) mycount
 FROM emp
 GROUP BY mgr_no) a);
                 
SELECT m.ename AS ManagerName
FROM emp m
JOIN emp e ON e.mgr_no = m.empno
GROUP BY m.empno, m.ename, m.sal
HAVING m.sal > AVG(e.sal);

