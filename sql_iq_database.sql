-- sql_iq database for MySQL Workbench practice
-- Import this file in MySQL Workbench, then run: USE sql_iq;

DROP DATABASE IF EXISTS sql_iq;
CREATE DATABASE sql_iq;
USE sql_iq;

-- PLAYERS
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    goals INT
);

INSERT INTO players VALUES
(101,'Sam','USA',6),
(103,'Daniel','England',7),
(104,'Anthony','France',10),
(102,'Bruno','Sweden',6),
(105,'David','Germany',8),
(106,'John','Brazil',9),
(107,'Robert','Spain',5),
(108,'Michael','Italy',11),
(109,'Alex','Canada',4),
(110,'Chris','India',7);

-- PRODUCTS
CREATE TABLE products (
    productcode VARCHAR(20) PRIMARY KEY,
    productname VARCHAR(100),
    msrp DECIMAL(10,2)
);

INSERT INTO products VALUES
('S10_1678','1969 Harley Davidson Ultimate Chopper',95.70),
('S10_2016','1996 Moto Guzzi 1100i',118.94),
('S12_3380','1968 Dodge Charger',117.44),
('S12_3990','1970 Plymouth Hemi Cuda',79.80),
('S12_4473','1957 Chevy Pickup',118.50),
('S12_4675','1969 Dodge Charger',115.16),
('S18_1097','1940 Ford Pickup Truck',116.67),
('S18_1342','1937 Lincoln Berline',102.74),
('S18_1367','1936 Mercedes-Benz 500K Special Roadster',53.91),
('S18_1589','1965 Aston Martin DB5',124.44);

-- EMPLOYEES
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    age INT
);

INSERT INTO employees VALUES
(1001,'John','Smith','Sales',45000,28),
(1002,'Mary','Jones','HR',52000,31),
(1003,'David','Brown','IT',65000,35),
(1004,'Sarah','Wilson','Finance',58000,29),
(1005,'James','Taylor','Sales',48000,32),
(1006,'Emma','Davis','IT',72000,38),
(1007,'Daniel','Miller','HR',50000,27),
(1008,'Olivia','Anderson','Finance',61000,34),
(1009,'Michael','Thomas','Sales',47000,30),
(1010,'Sophia','Moore','IT',68000,33);

-- CUSTOMERS
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1,'ABC Stores','USA','New York'),
(2,'Global Traders','England','London'),
(3,'India Retail','India','Mumbai'),
(4,'Paris Market','France','Paris'),
(5,'Berlin Shop','Germany','Berlin'),
(6,'Tokyo Sales','Japan','Tokyo'),
(7,'Toronto Retail','Canada','Toronto'),
(8,'Sydney Market','Australia','Sydney');

-- ORDERDETAILS
CREATE TABLE orderdetails (
    ordernumber INT,
    productcode VARCHAR(20),
    quantityordered INT,
    priceeach DECIMAL(10,2)
);

INSERT INTO orderdetails VALUES
(10100,'S10_1678',30,95.70),
(10101,'S10_2016',25,118.94),
(10102,'S12_3380',20,117.44),
(10103,'S12_3990',15,79.80),
(10104,'S12_4473',40,118.50),
(10105,'S12_4675',35,115.16),
(10106,'S18_1097',18,116.67),
(10107,'S18_1342',22,102.74);

-- STUDENTS
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50),
    marks INT
);

INSERT INTO students VALUES
(1,'Amit Sharma','AIML',78),
(2,'Neha Patil','Data Science',85),
(3,'Rahul Joshi','Computer',72),
(4,'Priya Shah','AIML',91),
(5,'Rohan Kulkarni','IT',68);

-- Check the database
SHOW TABLES;
