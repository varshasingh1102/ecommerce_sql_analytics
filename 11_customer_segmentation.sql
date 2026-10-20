 -- Customer value segment
 SELECT
    customer_id,
    total_spend,

    CASE
        WHEN total_spend >= 1000 THEN 'High Value'
        WHEN total_spend >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment

FROM customer_summary;
 -- Segment count
 SELECT
    CASE
        WHEN total_spend >= 1000 THEN 'High Value'
        WHEN total_spend >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,

    COUNT(*) AS total_customers

FROM customer_summary
GROUP BY customer_segment;