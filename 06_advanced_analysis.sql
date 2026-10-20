USE ecommerce_project;

-- customer city with purchased product category
SELECT
    c.customer_city,
    o.order_id,
    p.product_category_name,
    oi.price
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;

-- top cities by revenue
SELECT
    c.customer_city,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_city
ORDER BY total_revenue DESC
LIMIT 10;

-- revenue by category
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;
-- Cleaing of data 
-- products with null category
SELECT *
FROM products
WHERE product_category_name IS NULL;

-- products with null weight
SELECT *
FROM products
WHERE product_weight_g IS NULL;

-- duplicate products check
SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- invalid product weights
SELECT *
FROM products
WHERE product_weight_g <= 0;

-- BUSINESS KPI ANALYSIS
-- total revenue
SELECT
    ROUND(SUM(price),2) AS total_revenue
FROM order_items;

-- average order value
SELECT
    ROUND(AVG(price),2) AS avg_order_value
FROM order_items;

-- total orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- top categories by revenue
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- top states by revenue
SELECT
    c.customer_state,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;

-- Time analysis
-- monthly orders trend
SELECT
    YEAR(order_purchase_timestamp) AS order_year,
    MONTH(order_purchase_timestamp) AS order_month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- monthly revenue trend
SELECT
    YEAR(o.order_purchase_timestamp) AS order_year,
    MONTH(o.order_purchase_timestamp) AS order_month,
    ROUND(SUM(oi.price),2) AS monthly_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- delivered vs cancelled orders
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;


-- Case when 
-- product price segmentation
SELECT
    product_id,
    product_category_name,

    CASE
        WHEN product_weight_g > 5000 THEN 'Heavy'
        WHEN product_weight_g > 1000 THEN 'Medium'
        ELSE 'Light'
    END AS weight_category

FROM products;

-- order status categorization
SELECT
    order_id,
    order_status,

    CASE
        WHEN order_status = 'delivered'
            THEN 'Successful'

        WHEN order_status = 'canceled'
            THEN 'Failed'

        ELSE 'In Progress'
    END AS order_result

FROM orders;
-- CTES with Windows function
-- customers with more than 5 orders
WITH customer_orders AS (

    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id

)

SELECT *
FROM customer_orders
WHERE total_orders > 5;

-- rank products by price
SELECT
    product_id,
    product_category_name,
    product_weight_g,

    ROW_NUMBER() OVER(
        ORDER BY product_weight_g DESC
    ) AS product_rank

FROM products;

-- rank customers by total orders
WITH customer_order_counts AS (

    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id

)

SELECT
    customer_id,
    total_orders,

    RANK() OVER(
        ORDER BY total_orders DESC
    ) AS customer_rank

FROM customer_order_counts;