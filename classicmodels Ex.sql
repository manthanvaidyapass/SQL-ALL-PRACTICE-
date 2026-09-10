use classicmodels;

show tables;

select * from products;
select * from productlines;

select productcode, productname , textdescription from products inner join productlines using (productline);

select * from orders;
select * from orderdetails;

select o.ordernumber, o.status, p.productname,
sum(quantityordered * priceeach) as revenue
from orders as o
inner join orderdetails as od on o.ordernumber = od.ordernumber 
inner join products as p on p.productcode = od.productcode
group by o.ordernumber, o.status, p.productname;

select * from customers;
select * from orders;
select c.customernumber, c.customername , ordernumber ,status from customers as c left join orders as o on c.customernumber = o.customernumber;

select c.customernumber, c.customername , ordernumber ,status from customers as c left join orders as o on c.customernumber = o.customernumber where ordernumber is null;

select *  from customers;

select *  from employees;

select c.customername, c.phone, e.employeenumber, e.email 
from customers as c 
right join employees as e on e.employeenumber = c.salesrepemployeenumber 
order by employeenumber;

select * from employees;

select concat(m.lastname, ', ',m.firstname) as manager,concat(e.lastname,',',e.firstname)
as employee from employees as e inner join 
employees as m on m.employeeNumber=e.reportsto order by manager;

select c.customername ,o.ordernumber from customers as c left join
orders as o on c.customernumber = o.customernumber
union 
select c.customername ,o.ordernumber from customers as c right join
orders as o on c.customernumber = o.customernumber;