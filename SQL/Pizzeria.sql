CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  phone VARCHAR(25)
);

INSERT INTO customers (customer_id, customer_name, phone) VALUES
(1, 'Bob Johnson', '0812-123-4567'),
(2, 'Alice Brown', '0812-456-7890'),
(3, 'Tom Smith', '0812-789-1234'),
(4, 'Jane Doe', '0813-975-6542'),
(5, 'John Wick', '0911-659-6412');

CREATE TABLE menus (
  menu_id INT PRIMARY KEY,
  menu_name VARCHAR(200),
  price REAL
);

INSERT INTO menus (menu_id, menu_name, price) VALUES
(1, 'Sauasge Hawaiian', 13.60),
(2, 'BBQ Chicken', 13.00),
(3, 'Extreme Cheese', 10.80),
(4, 'Pepperoni', 14.30),
(5, 'Cheeseburger Beef', 17.50),
(6, 'Soda', 1.90),
(7, 'Pitcher', 7.70),
(8, 'Strawberry Smoothie', 3.60),
(9, 'Lemonade', 2.60),
(10, 'Bottled Wather', 2.00);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  menu_id INT,
  order_date DATE
);

INSERT INTO orders (order_id, customer_id, menu_id, order_date) VALUES
(1, 1, 1, '2023-11-06'),
(2, 1, 3, '2023-11-06'),
(3, 1, 5, '2023-11-06'),
(4, 1, 6, '2023-11-06'),
(5, 1, 9, '2023-11-06'),
(6, 2, 2, '2023-11-07'),
(7, 2, 3, '2023-11-07'),
(8, 2, 1, '2023-11-07'),
(9, 2, 10, '2023-11-07'),
(10, 3, 4, '2023-11-08'),
(11, 3, 8, '2023-11-08'),
(12, 4, 2, '2023-11-08'),
(13, 4, 3, '2023-11-08'),
(14, 4, 6, '2023-11-08'),
(15, 5, 4, '2023-11-08'),
(16, 5, 3, '2023-11-08'),
(17, 5, 4, '2023-11-08'),
(18, 5, 5, '2023-11-08'),
(19, 5, 8, '2023-11-08'),
(20, 5, 9, '2023-11-08');


.mode box

SELECT menu_name, price FROM menus;

--JOIN 3 TABLES  
SELECT 
  o.order_date,
  c.customer_name, 
  m.menu_name, 
  m.price
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN menus AS m ON o.menu_id = m.menu_id;


--Total price for each orders  
SELECT
  o.order_date,
  c.customer_name,
  SUM(m.price) AS total_price
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN menus AS m ON o.menu_id = m.menu_id
GROUP BY c.customer_name
ORDER BY total_price DESC;


--Customer Most Orders  
SELECT 
  c.customer_name,
  COUNT(o.order_id) AS total_order
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_order DESC
LIMIT 1;


--How many people ordered on the 8th Noveber 2023  
SELECT 
  c.customer_name,
  COUNT(o.order_id) AS total_order
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
WHERE o.order_date = '2023-11-08'
GROUP BY c.customer_name
ORDER BY total_order DESC;


--Highest food prices  
SELECT
  menu_name,
  price
FROM menus
WHERE price = (SELECT MAX(price)
               FROM menus);

--Which menu do customers buy the most--
SELECT 
  m.menu_name,
  COUNT(o.order_id) AS total_order
FROM orders AS o
JOIN menus AS m ON o.menu_id = m.menu_id
GROUP BY m.menu_name
ORDER BY total_order DESC
LIMIT 3;
