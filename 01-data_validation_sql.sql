USE ecommerce_project;

-- show all tables
SHOW TABLES;

-- preview customers table
SELECT *
FROM customers
LIMIT 10;

-- preview orders table
SELECT *
FROM orders
LIMIT 10;

-- preview products table
SELECT *
FROM products
LIMIT 10;

-- count total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- count total products
SELECT COUNT(*) AS total_products
FROM products;

-- check customers table structure
DESCRIBE customers;

-- check orders table structure
DESCRIBE orders;

-- check products table structure
DESCRIBE products;