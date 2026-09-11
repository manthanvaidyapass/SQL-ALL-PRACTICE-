# Subqueries

use sql_intro;

select * from employees;

select emp_name , dept , salary 
from employees where salary > (select avg(salary) from employees);

select emp_name ,gender,dept,salary
from employees where salary >
(select salary from employees where emp_name ='John');

use classicmodels;

select * from products;

select *from orderdetails;

select productcode , productname , msrp from products 
where productcode in(select productcode from orderdetails
where priceeach < 100);

## STORED PROCEDURE 

use sql_iq;
desc employees;
select * from players;

delimiter &&
create procedure top_players()
begin 
select name,country ,goals 
from players where goals > 6 ;
end &&

delimiter ;

call top_players;

### SP Using IN 

USE sql_iq;

DROP PROCEDURE IF EXISTS sp_sortbysalary;

DROP TABLE IF EXISTS emp_details;

CREATE TABLE emp_details AS
SELECT
    CONCAT(first_name, ' ', last_name) AS name,
    age,
    salary
FROM employees;

DELIMITER //

CREATE PROCEDURE sp_sortbysalary(IN var INT)
BEGIN
    SELECT name, age, salary
    FROM emp_details
    ORDER BY salary DESC
    LIMIT var;
END //

DELIMITER ;

CALL sp_sortbysalary(3);


delimiter //
create procedure update_salary(IN temp_name varchar(20) ,
 IN new_salary float)
 begin
 update emp_details set 
 salary = new_salary where name = temp_name;
 end; //
 
 delimiter ;
 
 select * from emp_details;
 
 set sql_safe_updates = 0;
 
 call update_salary('Marry', 80000);
 
 ### store procedure using out parameter
 
 delimiter //
 create procedure sp_countemployees(out total_emps int )
 begin
 select count(name) into total_emps from emp_details
 where sex = 'f';
 end // 
 
 delimiter ;
 
call sp_countemployees(@f_emp);
select@f_emp as female_emps;

###triger in sql (advanced sql)

create table student 
(st_roll int , age int , name varchar(30) , mark float) ;
 
 delimiter //
 create trigger mark_verify_st 
 before insert on student 
 for each row 
 if new.mark < 0 then set new.mark=50;
 end if; //
 
 
insert into student 
values(501,10, 'Ruth', 75.0),
(502,12, 'Mike', -20.5),
(503, 13, 'Dave', 90.0),
(504, 10, "Jacobs", -12.5);

select * from student ;

##### Drop Trigger  mark_verify_st ;

use classicmodels 
select * from customers;

create view cust_details 
as
select contactLastName , phone ,city 
from customers;

select * from cust_details;

select * from productlines;

create view product_description
as 
select productname , quantityinstock, msrp , textdescription
 from products as p inner join productlines as pl
 on p.productline = pl.productline;
 
 select * from product_description;
 
 ### Rename description 
USE classicmodels;

CREATE VIEW vehicle_description AS 
SELECT productname, quantityinstock, msrp, textdescription
FROM products AS p 
INNER JOIN productlines AS pl
ON p.productline = pl.productline;
 
 
 #### Display views 
SHOW FULL TABLES WHERE table_type = 'VIEW';

### Delete view 

 drop view cust_details;

### windows function 

use sql_intro;
select * from employees;

select emp_name , age , dept ,
sum(salary) over (partition by dept) as total_salary 
from employees ;

###Row Number Function 

select row_number() over(order by salary ) as row_num ,
 emp_name , salary from employees order by salary;
 
 create table demo (st_id int , st_name varchar(20));
 
 insert into demo 
 values(101,'Shane'),
(102,'Bradley'),
(103,'Herath'),
(103,'Herath'),
(104,'Nathan'),
(105,'Kevin'),
(105,'Kevin');

select * from demo ;

select st_id ,st_name , row_number () over 
(partition by st_id, st_name order by st_id ) as row_num from demo;

#### Rank Fuction 

create table demo1 (var_a int);

insert into demo1
value(101),(102),(103),(103),(104),(105),(106),(106),(107);

select var_a,
rank() over (order by var_a) as test_rank
from demo1;

## First Value ()

select emp_name, age, salary, first_value(emp_name)
over (order by salary desc) as highest_salary from employees;

select emp_name, dept, salary, first_value(emp_name)
over (partition by dept order by salary desc) as highest_salary
from employees;