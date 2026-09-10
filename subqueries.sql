-- Subqueries practice database for MySQL Workbench
-- Database name: subqueries

DROP DATABASE IF EXISTS subqueries;
CREATE DATABASE subqueries;
USE subqueries;

DROP TABLE IF EXISTS employees_b;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Doj DATE,
    Dept VARCHAR(50),
    City VARCHAR(50),
    Salary INT
);

INSERT INTO employees (Emp_Id, Emp_name, Age, Gender, Doj, Dept, City, Salary) VALUES
(106, 'Ammy',   35, 'F', '2014-12-20', 'IT',       'Seattle',  80000),
(107, 'Jack',   40, 'M', '2012-07-19', 'Finance',  'Houston', 100000),
(108, 'Angela', 36, 'F', '2007-02-04', 'Tech',     'New York',110000),
(109, 'Marcus', 25, 'M', '2010-07-18', 'HR',       'Boston',   90000),
(110, 'David',  34, 'M', '2009-08-25', 'Product',  'Miami',    75000),
(111, 'Rose',   28, 'M', '2011-02-27', 'Tech',     'Chicago',  60000),
(112, 'Sophia', 33, 'F', '2013-09-21', 'HR',       'Houston',  65000),
(113, 'Amelia', 30, 'F', '2018-10-15', 'Finance',  'Austin',   55000),
(114, 'Robert', 40, 'M', '2015-12-18', 'Sales',    'Detroit',  95000),
(115, 'William',36, 'M', '2016-04-20', 'IT',       'Chicago',  83000),
(116, 'John',   32, 'M', '2004-08-09', 'Marketing', 'Miami',   67000),
(117, 'Bella',  29, 'F', '2002-06-11', 'Tech',     'Detroit',  72000),
(118, 'Maya',   25, 'F', '2018-10-15', 'IT',       'Houston',  48000),
(119, 'Alice',  37, 'F', '2019-05-28', 'Product',  'Seattle',  76000),
(120, 'Joseph', 45, 'M', '2016-11-23', 'Sales',    'Chicago', 115000);

-- Backup/copy table, matching the second table visible in Workbench
CREATE TABLE employees_b AS
SELECT * FROM employees;

-- Check tables and data
SHOW TABLES;
SELECT * FROM employees;

-- Subquery example from the lesson:
-- Find the department having the maximum salary
SELECT Dept
FROM employees
WHERE Salary = (SELECT MAX(Salary) FROM employees);
