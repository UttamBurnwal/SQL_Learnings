/* Continuation of SQL QUERY 1 */

use happy;

select * from employee;

create table Department(
d_id int not null,
d_name varchar(20),
d_location varchar(20)
)

insert into Department values(
1, 'Content', 'New York'
);
insert into Department values(
2, 'Support', 'Chicago'
);
insert into Department values(
3, 'Analytics', 'New York'
);
insert into Department values(
4, 'Sales', 'Boston'
);
insert into Department values(
5, 'Tech', 'Dallas'
);
insert into Department values(
6, 'Finance', 'Chicago'
);

select * from Department;
select * from employee;

/* Inner Join */

select employee.e_dept, employee.e_name, Department.d_name, Department.d_location from employee 
INNER JOIN Department 
on employee.e_dept=Department.d_name

/* Left Join */

select employee.e_dept, employee.e_name, Department.d_name, Department.d_location from employee 
LEFT JOIN Department 
on employee.e_dept=Department.d_name

/* Right Join */

select employee.e_dept, employee.e_name, Department.d_name, Department.d_location from employee 
RIGHT JOIN Department 
on employee.e_dept=Department.d_name

/* Full Join */

select employee.e_name, employee.e_dept, Department.d_name, Department.d_location from employee
FULL JOIN Department
on employee.e_dept=Department.d_name

/* Updating table using information form another table */

update employee
set e_age=e_age+10
from employee
join Department on employee.e_dept=Department.d_name
where d_location='New York';

select * from employee;

/* Updating table using information form another table */

delete employee
from employee
join Department on employee.e_dept=Department.d_name
where d_location='New York';

select * from employee;

/* Union, Intersect, Except */

create table studentd1(
s_id int not null, 
s_name varchar(20),
s_marks int
);

insert into studentd1 values(
1, 'Ron', 75
)
insert into studentd1 values(
2, 'Karan', 82
)
insert into studentd1 values(
3, 'Rimmy', 63
)
insert into studentd1 values(
4, 'John', 73
)
insert into studentd1 values(
5, 'Loki',92
)
insert into studentd1 values(
6, 'Thor',72
)

create table studentd2(
s_id int not null, 
s_name varchar(20),
s_marks int);

insert into studentd2 values(
1, 'Roli', 91
)
insert into studentd2 values(
5, 'Loki',92
)
insert into studentd2 values(
6, 'Thor',72
)

select * from studentd1
select * from studentd2

select * from studentd1
union
select * from studentd2

select * from studentd1
union all
select * from studentd2

select * from studentd1
except
select * from studentd2

select * from studentd1
intersect
select * from studentd2


/* Create and Dropping View */

create view Female_Employees AS
select * from employee
where e_gender='Female';


select * from Female_Employees;

drop view Female_Employees

/* Adding and Dropping Column */

alter table employee 
add e_dob date;

select * from employee;

alter table employee
drop column e_dob 

/* Merging Tables */

create table employee_target(

e_id int not null,
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20),
primary key(e_id)
)

/* Inserting Values in Table */

insert into employee_target(e_id, e_name, e_salary, e_age, e_gender, e_dept)
values
(1, 'Sam', 95000, 45, 'Male', 'Operations' ),
(2, 'Bob', 55000, 35, 'Male', 'Support'  ),
(3, 'Sweety', 79000, 29, 'Female', 'HR' ),
(4, 'Sohil', 85000, 25, 'Male', 'Analytics' );

select * from employee
select * from employee_target

merge employee_target as T
using employee as S
			on T.e_id=S.e_id
when matched
			then update set T.e_salary=S.e_salary, T.e_age=S.e_age
when not matched by target
			then insert (e_id, e_name, e_salary, e_age, e_gender, e_dept)
			values (S.e_id, S.e_name, S.e_salary, S.e_age, S.e_gender, S.e_dept)
when not matched by source
			then delete;





