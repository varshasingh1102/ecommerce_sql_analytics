 -- Top sellers by orders
 SELECT
    seller_id,
    COUNT(order_id) AS total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC
LIMIT 10;
 -- Top sellers by revenue
 SELECT
    seller_id,
    ROUND(SUM(price),2) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;
 -- Average Revenue per seller
 SELECT
    seller_id,
    ROUND(AVG(price),2) AS avg_order_value
FROM order_items
GROUP BY seller_id
ORDER BY avg_order_value DESC;