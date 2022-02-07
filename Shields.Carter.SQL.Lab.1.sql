# 1.	Write a query to get Product name and quantity/unit.  
Select northwind.products.product_name, northwind.products.quantity_per_unit FROM northwind.products;
# 2. Write a query to get current Product list (Product ID and name).  
Select northwind.products.id, northwind.products.product_name FROM northwind.products;
# 3. Write a query to get discontinued Product list (Product ID and name). 
SELECT northwind.products.id, northwind.products.product_name FROM northwind.products WHERE northwind.products.discontinued = '1';
# 4. Write a query to get most expense and least expensive Product list (name and unit price).  
SELECT distinct northwind.products.product_name, northwind.order_details.unit_price FROM northwind.order_details JOIN northwind.products ON 
northwind.products.id = northwind.order_details.product_id WHERE northwind.order_details.unit_price= (SELECT MAX(northwind.order_details.unit_price) FROM northwind.order_details) OR 
northwind.order_details.unit_price= (SELECT MIN(northwind.order_details.unit_price) FROM northwind.order_details);
# 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.  
SELECT distinct northwind.products.id, northwind.products.product_name, northwind.order_details.unit_price FROM northwind.products JOIN northwind.order_details ON 
northwind.products.id = northwind.order_details.product_id WHERE northwind.order_details.unit_price<20;
# 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.  
SELECT distinct northwind.products.id, northwind.products.product_name, northwind.order_details.unit_price FROM northwind.products JOIN northwind.order_details ON 
northwind.products.id = northwind.order_details.product_id WHERE northwind.order_details.unit_price between 15 and 25;
# 7. Write a query to get Product list (name, unit price) of above average price.  
SELECT distinct northwind.products.product_name, northwind.order_details.unit_price FROM northwind.order_details JOIN northwind.products ON 
northwind.products.id = northwind.order_details.product_id WHERE northwind.order_details.unit_price> (SELECT AVG(northwind.order_details.unit_price) FROM northwind.order_details);
# 8. Write a query to get Product list (name, unit price) of ten most expensive products.  
SELECT distinct northwind.products.product_name, northwind.order_details.unit_price FROM northwind.order_details JOIN northwind.products ON northwind.products.id = northwind.order_details.product_id ORDER by northwind.unit_price LIMIT 10;
# 9. Write a query to count current and discontinued products. 
SELECT northwind.products.discontinued,COUNT(*) AS 'current' FROM northwind.products GROUP BY northwind.products.discontinued;
# 10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.  