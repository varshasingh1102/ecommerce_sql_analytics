USE ecommerce_project;
DESCRIBE customers;
DESCRIBE order_items;
DESCRIBE orders;
DESCRIBE payments;
DESCRIBE products;
DESCRIBE reviews;
DESCRIBE sellers;
USE ecommerce_project;

-- orders with customer city
SELECT
    o.order_id,
    o.order_status,
    c.customer_city,
    c.customer_state
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

-- order items with product category
SELECT
    oi.order_id,
    oi.product_id,
    p.product_category_name,
    oi.price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- customer orders with city and status
SELECT
    c.customer_city,
    o.order_id,
    o.order_status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- top expensive order items with category
SELECT
    oi.order_id,
    p.product_category_name,
    oi.price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
ORDER BY oi.price DESC
LIMIT 10;

-- total orders by customer city
SELECT
    c.customer_city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC
LIMIT 10;

-- average order item price by category
SELECT
    p.product_category_name,
    AVG(oi.price) AS avg_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY avg_price DESC;

-- total revenue by category
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;