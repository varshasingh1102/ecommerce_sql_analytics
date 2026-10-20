 -- Top 10 customers
 SELECT
    customer_id,
    total_spend
FROM customer_summary
ORDER BY total_spend DESC
LIMIT 10;
 -- Top 10 cities
 SELECT
    customer_city,
    SUM(total_spend) AS city_revenue
FROM customer_summary
GROUP BY customer_city
ORDER BY city_revenue DESC
LIMIT 10;
 -- Top product categories
 SELECT
    product_category_name,
    SUM(total_revenue) AS revenue
FROM product_summary
GROUP BY product_category_name
ORDER BY revenue DESC
LIMIT 10;
 -- Top States
 SELECT
    customer_state,
    SUM(total_spend) AS state_revenue
FROM customer_summary
GROUP BY customer_state
ORDER BY state_revenue DESC;
 -- Highest orders customers
 SELECT
    customer_id,
    total_orders
FROM customer_summary
ORDER BY total_orders DESC
LIMIT 10;