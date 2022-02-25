/* -------------Continuation of SQL QUERY 2-------------- */

/* ---------User Defined Functions-------- */

/* Scalar Valued Functions */

create function add_five(@num as int)
Returns int
as
begin
return(
@num+5
)
end

select dbo.add_five(10)

/* Table Valued Functions */

select * from employee

create function select_gender(@gender as varchar(20))
returns table
as 
return(
select * from employee where e_gender=@gender
)

select * from dbo.select_gender('Male')

select * from dbo.select_gender('Female')



/* Temp or Temporary Table */

create table #student(
s_id int not null,
s_name varchar(20)
);

select * from #student

insert into #student(s_id, s_name) values(
1, 'Sam'
)


/* Case Statement */

select case
when 10>20 then '10 is greater than 20'
when 10<20 then '10 is less than 20'
else '10 is equal to 20'
end

select * from employee

select *, e_grade=
case
when e_salary<80000 then 'C'
when e_salary<90000 then 'B'
else 'A'
end 
from employee

/* IIF Statement */

select
iif(10<20,'10 is less than 20','10 is greater than 20')


select *,
iif(e_age>30,'Older Generation', 'Younger Generation') as e_generation
from employee


/* Stored Procedure */

create procedure employee_age
as
select e_age from employee
go

exec employee_age


create procedure employee_details
as
select * from employee
go

exec employee_details


/* Stored Procedure with Parameter */

create procedure employee_gender @gender varchar(20)
as
select * from employee
where e_gender=@gender
go

exec employee_gender @gender='Male'

exec employee_gender 'Female'


