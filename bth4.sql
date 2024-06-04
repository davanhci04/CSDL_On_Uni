use classicmodels;

-- 1
select * from customers where city in ("Nantes", "Lyon");

-- 2
select * from orders where shippedDate between "2003-01-10" and '2003-03-10';

-- 3
select * from products where productLine like '%cars%';

-- 4
select * from  products order by quantityInStock DESC limit 10;

-- 5
select productCode, productName, quantityInStock, buyPrice, 
quantityInStock * buyPrice AS 'valueInStock'  from products;