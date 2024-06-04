use classicmodels;

-- 1
select city, count(*) as customers_from_city from customers group by city

-- 2
select count(*) as Ordered_in_March_2005 from orders where month(orderDate) = 3 and year(orderDate) = 2005;

-- 3
select month(orderDate), count(*) as so_luong_don_hang from orders where year(orderDate) = 2005 group by month(orderDate) order by month(orderDate);


-- 4
select orderNumber, sum(quantityOrdered * priceEach) as orderValue from orderdetails group by orderNumber order by orderValue desc
limit 10;

-- 5
select productLine, sum(quantityInStock) as Tong_hang_ton from products group by productLine;