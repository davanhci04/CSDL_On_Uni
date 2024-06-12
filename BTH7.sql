use classicmodels;

-- 1
select e.employeeNumber, e.lastName, e.firstName, e.extension, e.email, e.jobTitle, o.city as "OfficeName" from employees e join offices o on e.officeCode = o.officeCode;

-- 2
select cus.customerName, pro.productName from customers cus join orders o on cus.customerNumber = o.customerNumber join orderdetails od on o.orderNumber = od.orderNumber join products pro on od.productCode = pro.productCode;

-- 3
select * from products;
select * from orderdetails;
select pro.productCode, pro.productName, pro.productLine, pro.productScale, pro.productVendor, pro.productDescription, pro.quantityInStock, pro.buyPrice, pro.MSRP from products pro left join orderdetails od on pro.productCode = od.productCode where od.productCode is null;

-- 4
select o.orderDate, o.requiredDate, o.status, sum(od.quantityOrdered * od.priceEach) as 'total' from orders o join orderdetails od on o.orderNumber = od.orderNumber where month(o.orderDate) = '3' and year(o.orderDate) = '2005' group by o.orderNumber;

-- 5
select pro.productLine, pro.textDescription, sum(p.quantityInStock) as 'productQuantity' from productlines pro join products p on pro.productLine = p.productLine group by pro.productLine order by productQuantity desc;