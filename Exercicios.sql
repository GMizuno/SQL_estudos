-- Ex: 01
SELECT COUNT(*)
FROM tb_products
WHERE product_category_name = 'artes';

-- Ex: 02
SELECT COUNT(DISTINCT product_id)
FROM tb_products
WHERE product_length_cm * product_height_cm * product_width_cm / 1000 > 5;

-- Ex: 02 SOLUÇÃO 2
select SUM(
       CASE WHEN product_length_cm * product_height_cm * product_width_cm / 1000 > 5 THEN 1
       ELSE 0
       END
       ) AS COUNT_VOL_MAIOR_5
FROM tb_products;

-- Ex: 03
SELECT product_id,
    product_length_cm * product_height_cm * product_width_cm / 1000 as Vol_m3, 
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM tb_products;

-- Ex: 04
SELECT COUNT(*)
FROM tb_products
where product_length_cm * product_height_cm * product_width_cm / 1000 < 1 AND
product_category_name = 'beleza_saude'

-- Ex: 05
select product_category_name, 
       AVG(product_description_lenght) AS tamanho_medio,
       MIN(product_description_lenght) AS tamanho_min,
       MAX(product_description_lenght) AS tamanho_max
FROM tb_products
GROUP BY product_category_name

-- Ex: 06
select product_category_name, 
       AVG(product_name_lenght) AS tamanho_medio,
       MIN(product_name_lenght) AS tamanho_min,
       MAX(product_name_lenght) AS tamanho_max
FROM tb_products
GROUP BY product_category_name

-- Ex: 07
select product_category_name, 
       AVG(product_name_lenght) AS tamanho_medio,
       MIN(product_name_lenght) AS tamanho_min,
       MAX(product_name_lenght) AS tamanho_max
FROM tb_products
WHERE product_description_lenght >= 100
GROUP BY product_category_name

-- Ex: 08
select product_category_name, 
       AVG(product_name_lenght) AS tamanho_medio,
       MIN(product_name_lenght) AS tamanho_min,
       MAX(product_name_lenght) AS tamanho_max,
       AVG(product_description_lenght)
FROM tb_products
WHERE product_description_lenght >= 100
GROUP BY product_category_name
HAVING AVG(product_description_lenght) > 500

-- Ex: 09
SELECT 
       cliente.customer_state,
       SUM(itens.price) AS lucro_por_estado,
       SUM(itens.price)/COUNT(DISTINCT cliente.customer_id) AS lucro_por_cliente
FROM tb_orders as pedidos
LEFT JOIN tb_order_items as itens
ON pedidos.order_id = itens.order_id

LEFT JOIN tb_customers as cliente
ON pedidos.customer_id = cliente.customer_id

WHERE order_status = 'delivered'
GROUP BY 1
ORDER BY lucro_por_cliente DESC
-- ORDER BY lucro_por_estado DESC

-- Ex: 10

-- Ex: 11

-- Ex: 12

-- Ex: 13

-- Ex: 14

-- Base 
SELECT * FROM tb_products;
SELECT * FROM tb_geolocation;
SELECT * FROM tb_order_items;
SELECT * FROM tb_order_payments;
SELECT * FROM tb_order_reviews;
SELECT * FROM tb_orders;
SELECT * FROM tb_product_category_name_translation;
SELECT * FROM tb_sellers;
SELECT * FROM tb_customers;
