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
