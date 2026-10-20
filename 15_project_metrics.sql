-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Products
SELECT COUNT(*) AS total_products
FROM products;

-- Total Sellers
SELECT COUNT(*) AS total_sellers
FROM sellers;

-- Total Revenue
SELECT ROUND(SUM(price),2) AS total_revenue
FROM order_items;

-- Average Order Value
SELECT ROUND(AVG(price),2) AS avg_order_value
FROM order_items;