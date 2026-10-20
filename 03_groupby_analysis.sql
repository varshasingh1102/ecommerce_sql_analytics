USE ecommerce_project;
desc products;
-- total products in each category
SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC;

-- average product weight by category
SELECT
    product_category_name,
    AVG(product_weight_g) AS avg_weight
FROM products
GROUP BY product_category_name
ORDER BY avg_weight DESC;

-- maximum product weight by category
SELECT
    product_category_name,
    MAX(product_weight_g) AS max_weight
FROM products
GROUP BY product_category_name
ORDER BY max_weight DESC;

-- minimum product weight by category
SELECT
    product_category_name,
    MIN(product_weight_g) AS min_weight
FROM products
GROUP BY product_category_name
ORDER BY min_weight ASC;

-- categories having more than 100 products
SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
HAVING COUNT(*) > 100
ORDER BY total_products DESC;

-- top 10 categories with highest average name length
SELECT
    product_category_name,
    AVG(product_name_lenght) AS avg_name_length
FROM products
GROUP BY product_category_name
ORDER BY avg_name_length DESC
LIMIT 10;

-- top 10 heaviest product categories
SELECT
    product_category_name,
    AVG(product_weight_g) AS avg_weight
FROM products
GROUP BY product_category_name
ORDER BY avg_weight DESC
LIMIT 10;

-- Find categories having less than 50 products.
SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
HAVING COUNT(*) < 50
ORDER BY total_products DESC;

-- Find top 5 categories with lowest average weight.
SELECT
    product_category_name,
    AVG(product_weight_g) AS avg_weight
FROM products
GROUP BY product_category_name
ORDER BY avg_weight ASC
LIMIT 5;