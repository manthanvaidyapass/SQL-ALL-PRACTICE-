show databases;
use world;
show tables;
select * from city;
describe city;
create database sql_intro;
show databases ;

create table emp_details (Name varchar (25) , Age int , Sex char(1) ,doj date ,city varchar(15), salary float);
describe emp_details;

insert into emp_details
values("Jimmy", 35, "M", "2005-05-30", "Chicago", 70000),
("Shane", 30, "M", "1999-06-25", "Seattle", 55000),
("Marry", 28, "F", "2009-03-10", "Boston", 62000),
("Dwayne", 37, "M", "2011-07-12", "Austin", 57000),
("Sara", 32, "F", "2017-10-27", "New York", 72000),
("Ammy", 35, "F", "2014-12-20", "Seattle", 80000);

select * from emp_details;
select distinct city from emp_details;

select count(name) as count_name from emp_details;

select avg(salary) from emp_details;

select name , age , city from emp_details;
select * from emp_details where age >30;

select name ,sex ,city from emp_details where sex = 'F';

select * from emp_details where city = 'chicago' or city = 'Austin';

select * from emp_details where city in ( 'chicago' ,'Austin');

select * from emp_details where doj between '2000-01-01' and '2010-12-31';

select * from emp_details where age >30 and sex ='M';

select sex , sum(salary) as total_salary from emp_details group by sex;

select * from emp_details order by salary desc;

select (10-20) as addition;

select length('India') as total_len;

select repeat('@' ,10);

select upper('India');

select curdate();

select day(curdate());
select now();


# String Function

select upper('India') as upper_case;
select Lcase('India') as Lower_case;

 # length of string 
 select character_length('India') as total_len;
 
 
 CREATE TABLE IF NOT EXISTS students (
    stu_id INT PRIMARY KEY AUTO_INCREMENT,
    stu_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    doa DATE,
    city VARCHAR(50)
);

INSERT INTO students (stu_id, stu_name, age, gender, doa, city) VALUES
(1, 'Rahul', 20, 'Male', '2021-05-10', 'Mumbai'),
(2, 'Priya', 22, 'Female', '2020-08-15', 'Pune'),
(3, 'Amit', 19, 'Male', '2022-01-20', 'Delhi'),
(4, 'Ananya', 21, 'Female', '2021-11-05', 'Bangalore');


 select character_length(stu_name) as total_len from students;
 
 select stu_name , char_length(stu_name) as total_len from students;
 
 select concat("India" ," is" , " in Asia") AS MERGED;

select stu_id , stu_name, concat(stu_name, " " ,age) as name_age from students;

select reverse ('India');

select reverse (stu_name) from students;

select replace("orange is a vegetable" ,"vegetable" , "fruits");

select length("      India          ");

select length(ltrim("       India          "));
select length(rtrim("       India          "));
select length(trim("       India          "));


select position("fruit" in "orange is a fruit ") as name;

#final function we going to see

select ascii('a');
select ascii('4');
