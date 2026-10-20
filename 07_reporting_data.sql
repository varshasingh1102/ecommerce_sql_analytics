CREATE TABLE customer_summary AS
SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price),2) AS total_spend
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_city,
    c.customer_state;
    
CREATE TABLE product_summary AS
SELECT
    p.product_id,
    p.product_category_name,
    COUNT(oi.order_id) AS total_orders,
    ROUND(SUM(oi.price),2) AS total_revenue,
    ROUND(AVG(oi.price),2) AS avg_price
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_category_name;