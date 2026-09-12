# find the lowest salary for each dept 

use sql_intro ;

select *from employees;

select dept , min(salary)  as lowest_salary from employees
group by dept ;



### UNIQUE DEPTS

SELECT distinct DEPT FROM employees;


###UNIQUE DEPT AND LENGTH 

Select distinct dept , length(dept) as dept_length from employees;

#### Datediff Function

select datediff('2021-06-08', '2021-04-20') as total_days;
select datediff(now(), '2021-04-20');

# Depts with more than 2 emps

select dept, count(emp_id) as total_emps from employees
group by dept having count(emp_id) > 2;

# Details of emps apart from marketing

select * from employees
where dept <> 'Marketing';

select * from employees
where dept != 'Marketing';

# Emps joined before apr 2010 and after may 2005

select * from employees
where doj > '2022-01-15' and doj < '2023-07-05';

#### 3 RD HIGHEST SALARY

select * from (select * from employees order by salary desc limit 3) as Temp
order by salary limit 1;

###  PRINT ALTERNATIVE RECORDS 

select * from employees where emp_id % 2 = 0;
with CTE as
(
    select *, row_number() over (order by emp_id) as rn
    from employees
)
select * from cte where rn % 2 = 0;

# Duplicate records
create table dup_employees (
    e_id int,
    name varchar(50),
    age int
);

-- 2. (Insert Data)
insert into dup_employees (e_id, name, age) values
(101, 'Sam', 40),
(102, 'Tom', 35),
(103, 'Marry', 28),
(101, 'Sam', 40),
(103, 'Marry', 30);


select * from dup_employees;

select e_id, name, age ,count(*) as dup_count from dup_employees
group by e_id, name, age
having count(e_id) > 1 and count(name) > 1 and count(age) >1;

### EMPLOYEES WITH 2 A'S

SELECT *  FROM EMPLOYEES;

select length(replace(upper(emp_name), 'A', '')) from employees;

select * from employees
where length(emp_name) - length(replace(upper(emp_name), 'A', '')) = 2;

# Extract strings

select substr("Michael Ballack", 2, 4);

select substring("Michael Ballack", 4, 3);

