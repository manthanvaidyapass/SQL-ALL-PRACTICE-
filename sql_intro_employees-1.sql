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

INSERT INTO employees (Emp_Id, Emp_name, Age, Gender, Doj, Dept, City, Salary) VALUES
(101, 'Amit', '25', 'M', '2022-01-15', 'IT', 'Pune', 45000),
(102, 'Sneha', '28', 'F', '2021-06-20', 'HR', 'Mumbai', 52000),
(103, 'Rahul', '30', 'M', '2020-03-10', 'Finance', 'Pune', 65000),
(104, 'Priya', '24', 'F', '2023-07-05', 'IT', 'Nashik', 40000),
(105, 'Akash', '32', 'M', '2019-11-25', 'Sales', 'Mumbai', 58000),
(106, 'Neha', '27', 'F', '2022-09-12', 'IT', 'Pune', 48000),
(107, 'Rohan', '29', 'M', '2021-02-18', 'HR', 'Nagpur', 50000),
(108, 'Pooja', '26', 'F', '2023-01-30', 'Finance', 'Pune', 62000),
(109, 'Vikas', '35', 'M', '2018-05-14', 'Sales', 'Nashik', 70000),
(110, 'Anjali', '31', 'F', '2020-08-22', 'IT', 'Mumbai', 75000),
(111, 'Sagar', '23', 'M', '2024-02-10', 'Sales', 'Pune', 35000),
(112, 'Kavita', '34', 'F', '2019-12-01', 'HR', 'Nagpur', 68000),
(113, 'Nitin', '28', 'M', '2022-04-17', 'Finance', 'Mumbai', 60000),
(114, 'Meena', '29', 'F', '2021-10-08', 'Sales', 'Pune', 55000),
(115, 'Sachin', '33', 'M', '2018-09-19', 'IT', 'Nagpur', 72000);

SELECT * FROM employees;
