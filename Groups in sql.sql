CREATE DATABASE IF NOT EXISTS sql_intro;
USE sql_intro;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(25),
    Age INT,
    Gender CHAR(1),
    Doj DATE,
    Dept VARCHAR(20),
    City VARCHAR(15),
    Salary FLOAT
);

INSERT INTO employees VALUES
(101, 'Jimmy', 35, 'M', '2005-05-30', 'Sales', 'Chicago', 70000),
(102, 'Shane', 30, 'M', '1999-06-25', 'Marketing', 'Seattle', 55000),
(103, 'Marry', 28, 'F', '2009-03-10', 'Product', 'Boston', 62000),
(104, 'Dwayne', 37, 'M', '2011-07-12', 'Tech', 'Austin', 57000),
(105, 'Sara', 32, 'F', '2017-10-27', 'Sales', 'New York', 72000),
(106, 'Amelia', 27, 'F', '2019-01-14', 'HR', 'Chicago', 50000),
(107, 'Jack', 41, 'M', '2012-11-22', 'Marketing', 'Seattle', 82000),
(108, 'Angela', 36, 'F', '2007-02-04', 'Tech', 'New York', 110000),
(109, 'Marcus', 25, 'M', '2010-07-18', 'HR', 'Boston', 90000),
(110, 'David', 34, 'M', '2009-08-25', 'Product', 'Miami', 75000),
(111, 'Rose', 28, 'F', '2011-02-17', 'Tech', 'Chicago', 60000),
(112, 'Sophia', 33, 'F', '2013-09-21', 'HR', 'Houston', 65000),
(113, 'Amelia', 30, 'F', '2018-10-15', 'Finance', 'Austin', 55000),
(114, 'Robert', 40, 'M', '2015-12-18', 'Sales', 'Detroit', 95000),
(115, 'William', 36, 'M', '2016-04-20', 'IT', 'Chicago', 83000),
(116, 'John', 32, 'M', '2004-08-09', 'Marketing', 'Miami', 67000),
(117, 'Bella', 29, 'F', '2002-06-11', 'Tech', 'Detroit', 72000),
(118, 'Maya', 25, 'F', '2018-10-15', 'IT', 'Houston', 48000),
(119, 'Alice', 37, 'F', '2019-05-28', 'Product', 'Seattle', 76000),
(120, 'Joseph', 45, 'M', '2016-11-23', 'Sales', 'Chicago', 115000);

SELECT * FROM employees;

select distinct city from employees;
select distinct dept from employees;

select avg(age) from employees;

#avg age in each department 

select dept ,round(avg(age),1) as average_age from employees group by dept;

select dept ,sum(salary) as total_salary from employees group by dept;

#order by clause or group by clause ..... find total number of employees in each city with emp id 

select count(emp_id),city from employees group by city order by count(emp_id) desc;



########find number of employees who join the company each year we can use year funtion

select year(doj) as year ,count(emp_id) from employees group by year(doj);

create table sales(product_id int ,sell_price float,quantity int ,state varchar(20));

insert into sales values
(121, 320.0, 3, 'California'),
(121, 320.0, 6, 'Texas'),
(121, 320.0, 4, 'Alaska'),
(123, 290.0, 2, 'Texas'),
(123, 290.00, 7, 'Calfornia'),
(123, 290.00, 4, 'Washington'),
(121, 320.0, 7, 'Ohio'),
(121, 320.0, 2, 'Arizona'),
(123, 290.00, 8, 'Colorado');

select * from sales;

select product_id, sum(sell_price * quantity ) as revenue from sales group by product_id;

create table c_product (product_id int , cost_price float);

insert into c_product values(121 ,270.0),(123,250.0);

select c.product_id, sum((s.sell_price - c.cost_price) * s.quantity) as profit from sales as s inner join c_product as c where s.product_id =c.product_id group by c.product_id;

####having clause in sql


select * from employees;

select dept, avg(salary) as avg_salary from employees group by dept having avg (salary) > 70000;

select city,sum(salary) as total from employees group by city having sum(salary) >200000;

###depart more than 2 employees having clauses :

select dept, count(*) as emp_count from employees group by dept having count(*)>2;

######where clasue in having clause

select city, count(*) as emp_count from employees where city != "houston" group by city having count(*) >2;

#####aggrigate clause in having clause ##### find total number of emplyeee for each department having avg salary grater than 75000 dollars 

select dept ,count(*) as emp_count from employees group by dept having avg(salary) >75000;

