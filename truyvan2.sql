use classicmodels;

select * from classicmodels.employees where reportsTo is NULL ;
select * from classicmodels.customers where salesRepEmployeeNumber is not NULL ;
select * from classicmodels.orders where requiredDate = '2003/1/18';
select * from classicmodels.orders where orderDate between '2005/4/1' and '2005/4/30' and status = 'Shipped';
select * from classicmodels.products where productLine = 'Classic Cars';