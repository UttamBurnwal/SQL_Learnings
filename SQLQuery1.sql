/* Creating Table */

create table employee(

e_id int not null,
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20),
primary key(e_id)
)

/* Inserting Values in Table */

insert into employee values(
1, 'Sam', 95000, 45, 'Male', 'Operations' 
);

insert into employee values(
2, 'Bob', 55000, 35, 'Male', 'Support' 
);

insert into employee values(
3, 'Sonya', 120000, 25, 'Female', 'Analytics' 
);

insert into employee values(
4, 'Matt', 85000, 30, 'Male', 'HR' 
);

insert into employee values(
5, 'Karn', 90000, 41, 'Male', 'Support' 
);

insert into employee values(
6, 'Emily', 60000, 37, 'Female', 'Analytics' 
);

/* Selecting Columns from Table */

select e_name from employee;

select e_age from employee;

select e_name, e_age, e_gender from employee;

select * from employee;

select distinct e_gender from employee;

/* Queries using conditions */

select * from employee where e_gender='Female';

select * from employee where e_age<30;

select * from employee where e_salary>=90000;

select * from employee where e_salary>=90000 and e_gender='Male';

select * from employee where e_dept='Support' or e_dept='Operations';

select * from employee where e_salary>=90000 or e_age>=40;

select * from employee where not e_gender='Female';

select * from employee where e_name LIKE 'S%';

select * from employee where e_age LIKE '3%';

select * from employee where e_age BETWEEN 35 and 40;

select * from employee where e_salary BETWEEN 90000 and 120000;

/* Functions - Min, Max, Count, Sum, Avg, ltrim, Lower, Upper, Reverse, Substring */

select min(e_salary) from employee;

select min(e_age) from employee;

select max(e_salary) from employee;

select max(e_age) from employee;

select count(*) from employee where e_gender='Male';

select count(*) from employee where e_gender='Female';

select sum(e_salary) from employee;

select sum(e_salary) from employee where e_age>=40;

select avg(e_salary) from employee;

select avg(e_age) from employee;

select '    spartaaa';

select ltrim('    spartaaa');

select 'THIS IS SPARTA'

select lower('THIS IS SPARTA')

select 'hello world'

select upper('hello world')

select reverse('hello world')

select substring('hello world', 7, 5)

/* Order By, Group By, Top 3 */

select * from employee

select * from employee order by e_salary

select * from employee order by e_salary DESC

select e_name, e_age, e_salary from employee order by e_salary DESC

select TOP 3 * from employee order by e_salary 

select TOP 3 * from employee order by e_salary DESC

select TOP 3 * from employee order by e_age DESC

select avg(e_salary), e_gender from employee group by e_gender

select avg(e_age), e_dept from employee group by e_dept order by avg(e_age) DESC

select avg(e_salary), e_dept from employee group by e_dept order by avg(e_salary) DESC

select e_dept, avg(e_salary) as avg_salary
from employee
group by e_dept having avg(e_salary)>=90000

update employee set e_age=42 where e_name='Sam'

select * from employee

/* Update, Delete and Truncate Function */

update employee set e_dept='Tech' where e_gender='Female'

update employee set e_salary=80000

delete from employee where e_age=30

delete from employee where e_name='Sam'

truncate table employee



