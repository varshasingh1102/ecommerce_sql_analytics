USE ecommerce_project;

-- unique product categories
SELECT DISTINCT product_category_name
FROM products;

-- total products
SELECT COUNT(*) AS total_products
FROM products;

-- preview products table
SELECT *
FROM products
LIMIT 10;

-- products where product name length is greater than 50
SELECT *
FROM products
WHERE product_name_lenght > 50;

-- products where description length is greater than 500
SELECT *
FROM products
WHERE product_description_lenght > 500;

-- average product name length
SELECT AVG(product_name_lenght) AS avg_name_length
FROM products;

-- maximum product weight
SELECT MAX(product_weight_g) AS max_weight
FROM products;

-- minimum product weight
SELECT MIN(product_weight_g) AS min_weight
FROM products;

-- products with weight greater than 1000 grams
SELECT *
FROM products
WHERE product_weight_g > 1000;

-- products between 500g and 2000g
SELECT *
FROM products
WHERE product_weight_g BETWEEN 500 AND 2000;

-- top heaviest products
SELECT *
FROM products
ORDER BY product_weight_g DESC
LIMIT 10;

-- lightest products
SELECT *
FROM products
ORDER BY product_weight_g ASC
LIMIT 10;

select * from products where product_weight_g<250;
select * from products order by product_length_cm asc LIMIT 3;



