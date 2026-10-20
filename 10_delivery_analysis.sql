 -- Average delivery Days
 SELECT
    AVG(
        DATEDIFF(
            order_delivered_customer_date,
            order_purchase_timestamp
        )
    ) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;
 -- Fastest states
 SELECT
    c.customer_state,
    AVG(
        DATEDIFF(
            o.order_delivered_customer_date,
            o.order_purchase_timestamp
        )
    ) AS avg_delivery_days
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days ASC;
 -- Slowest states
 SELECT
    c.customer_state,
    AVG(
        DATEDIFF(
            o.order_delivered_customer_date,
            o.order_purchase_timestamp
        )
    ) AS avg_delivery_days
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC;