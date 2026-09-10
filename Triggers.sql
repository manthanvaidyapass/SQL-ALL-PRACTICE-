DROP DATABASE IF EXISTS triggers;
CREATE DATABASE triggers;
USE triggers;

###### Before Insert Triggers

CREATE TABLE customers (
    cust_id INT,
    age INT,
    name VARCHAR(30)
);

DELIMITER //
CREATE TRIGGER age_verify 
BEFORE INSERT ON customers
FOR EACH ROW 
BEGIN
    IF NEW.age < 0 THEN 
        SET NEW.age = 0;
    END IF;
END //
DELIMITER ;

INSERT INTO customers VALUES 
(101, 27, 'james'),
(102, -47, 'Ammy'),
(103, 32, 'Ben'),
(104, -39, 'Angela');

SELECT * FROM customers;


### AFTER INSERT TRIGGERS

CREATE TABLE customers1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(30),
    birthdate DATE
);

CREATE TABLE message (
    id INT AUTO_INCREMENT,
    message_Id INT,
    message VARCHAR(300) NOT NULL,
    PRIMARY KEY (id, message_Id)
);

DELIMITER //
CREATE TRIGGER check_null_dob
AFTER INSERT ON customers1
FOR EACH ROW
BEGIN
    IF NEW.birthdate IS NULL THEN
        INSERT INTO message (message_id, message)
        VALUES (NEW.id, CONCAT('Hi ', NEW.name, ', please update your date of birth.'));
    END IF;
END //
DELIMITER ;

INSERT INTO customers1 (name, email, birthdate) VALUES 
('Nancy', 'nancy@abc.com', NULL),
('Ronald', 'Ronald@xyz.com', '1998-11-16'),
('Krish', 'Krish@xyz.com', '1997-08-20'),
('Alice', 'Alice@anc.com', NULL);

SELECT * FROM message;


### BEFORE UPDATE TRIGGERS

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(25),
    age INT,
    salary FLOAT
);

INSERT INTO employees VALUES
(101, 'Jimmy', 35, 70000),
(102, 'Shane', 30, 55000),
(103, 'Marry', 28, 62000),
(104, 'Dwayne', 37, 57000),
(105, 'Sara', 32, 72000),
(106, 'Ammy', 35, 80000),
(107, 'Jack', 40, 100000);

DELIMITER //
CREATE TRIGGER upd_trigger
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN 
    IF NEW.salary = 10000 THEN 
        SET NEW.salary = 85000;
    ELSEIF NEW.salary < 10000 THEN
        SET NEW.salary = 72000;
    END IF;
END //
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
UPDATE employees SET salary = 8000;

SELECT * FROM employees;


##### BEFORE DELETE TRIGGERS

CREATE TABLE salary (
    eid INT PRIMARY KEY,
    validfrom DATE NOT NULL,
    amount FLOAT NOT NULL
);

INSERT INTO salary (eid, validfrom, amount) VALUES
(101, '2005-05-01', 55000),
(102, '2007-08-01', 68000),
(103, '2006-09-01', 75000);

CREATE TABLE salarydel (
    id INT PRIMARY KEY AUTO_INCREMENT,
    eid INT,
    validfrom DATE NOT NULL,
    amount FLOAT NOT NULL,
    deletedat TIMESTAMP DEFAULT NOW()
);

DELIMITER $$
CREATE TRIGGER salary_delete
BEFORE DELETE ON salary
FOR EACH ROW 
BEGIN
    INSERT INTO salarydel (eid, validfrom, amount)
    VALUES (OLD.eid, OLD.validfrom, OLD.amount);
END $$
DELIMITER ;

DELETE FROM salary WHERE eid = 103;

SELECT * FROM salarydel;