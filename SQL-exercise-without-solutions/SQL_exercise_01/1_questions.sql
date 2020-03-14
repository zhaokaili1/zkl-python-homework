-- LINK: The_computer_store
-- 1.1 Select the names of all the products in the store.
select name from Products;

-- 1.2 Select the names and the prices of all the products in the store.
SELECT name, price from Products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT name from products where price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
SELECT * from products where price BETWEEN 60 and 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT name, price*100 new_price from products;

-- 1.6 Compute the average price of all the products.
SELECT avg(price) from products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT code, avg(price) from products GROUP by code HAVING code=2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT count(*) from products where price>=180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT name, price from products where price >= 180 order by price desc, name;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT p.*, m.* from products p join manufacturers m on p.manufacturer=m.code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT p.name, price, m.name from products p join manufacturers m on p.manufacturer=m.code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT  m.code, avg(price) from products p join manufacturers m on p.manufacturer=m.code group by m.code;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT m.name, avg(price) from products p join manufacturers m on p.manufacturer=m.code group by m.code;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT m.name, avg(price) from manufacturers m join products p on m.code = p.manufacturer group by m.code having avg(price)>=150;

-- 1.15 Select the name and price of the cheapest product.
SELECT name, price from products order by price limit 1;

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT m.name, p.name, price from manufacturers m join products p on m.code=p.manufacturer order by price desc limit 1;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT into Products(Code,Name,Price,Manufacturer) values(11, 'Loudspeakers', 70, 2);

-- 1.18 Update the name of product 8 to "Laser Printer".
update products set name='Laser Printer' where code=8;

-- 1.19 Apply a 10% discount to all products.
update products set price = price * 0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update products set price = price * 0.9 where price>=120;
