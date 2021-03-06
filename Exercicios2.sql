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
SELECT 
       vendedor.seller_state,
       SUM(itens.price)/COUNT(distinct vendedor.seller_id) as lucro_por_seller_do_estado,
       SUM(itens.price) as lucro_por_estado,
       COUNT(distinct vendedor.seller_id) as num_de_sellers
FROM tb_sellers as vendedor
LEFT JOIN tb_order_items as itens
ON vendedor.seller_id = itens.seller_id

LEFT JOIN tb_orders AS pedidos
ON itens.order_id = pedidos.order_id

where order_status = 'delivered'

GROUP BY 1
ORDER BY 2 DESC;

-- Ex: 11
SELECT 
       vendedor.seller_state,
       AVG(produtos.product_weight_g) AS peso_medio,
       COUNT(DISTINCT vendedor.seller_id) AS num_vendedor
FROM tb_products as produtos
LEFT JOIN tb_order_items AS itens
ON produtos.product_id = itens.product_id

LEFT JOIN tb_sellers as vendedor
ON vendedor.seller_id = itens.seller_id

LEFT JOIN tb_orders AS pedidos
ON pedidos.order_id = itens.order_id

WHERE order_status = 'delivered' AND 
      strftime('%Y', order_approved_at) = '2017'

GROUP BY 1

-- Ex: 12
SELECT 
       product_category_name,
       SUM(price) AS lucro
FROM tb_products AS produto
LEFT JOIN tb_order_items AS itens
ON produto.product_id = itens.product_id

where product_category_name IS NOT NULL 

GROUP BY 1
ORDER BY lucro DESC

-- Ex: 13
SELECT 
       product_category_name,
       COUNT(itens.product_id) AS num_de_compras
FROM tb_order_items as itens
LEFT JOIN tb_products AS produtos
ON produtos.product_id = itens.product_id 

LEFT JOIN tb_orders as pedidos
ON pedidos.order_id = itens.order_id

WHERE pedidos.order_status = 'delivered' AND product_category_name IS NOT NULL 

GROUP BY 1

ORDER BY num_de_compras DESC

-- Ex: 14
SELECT
       SUM(price) as lucro,
       strftime('%d-%m-%Y', pedidos.order_approved_at) as dia
FROM tb_order_items AS itens
LEFT JOIN tb_orders as pedidos
ON itens.order_id = pedidos.order_id    

WHERE dia IS NOT NULL

GROUP BY dia
ORDER BY LUCRO DESC

-- Ex: 15
SELECT
       COUNT(itens.order_id) as num_pedidos,
       strftime('%d-%m-%Y', pedidos.order_approved_at) as dia
FROM tb_order_items AS itens
LEFT JOIN tb_orders as pedidos
ON itens.order_id = pedidos.order_id    

WHERE dia IS NOT NULL

GROUP BY dia
ORDER BY num_pedidos DESC

-- Ex: 16

-- Ex: 17
 

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

-- Teste para entender o order_id
SELECT DISTINCT order_id, order_item_id
FROM tb_order_items as itens
WHERE order_item_id >= 10
ORDER BY order_item_id ASC

-- Veja o q mesmo pedido possui mais de um item e que a coluna price mostra o preco de cada item 
-- e não o total do pedidos, ou seja, temos que somar todos os preçoes para achar o total do pedidos
-- o mesmo vale para frente 
SELECT *
FROM tb_order_items
WHERE order_id = '8272b63d03f5f79c56e9e4120aec44ef'

SELECT *
FROM tb_order_items
WHERE order_id = '30bdf3d824d824610a49887486debcaf'


SELECT COUNT(product_id), product_id
FROM tb_order_items
WHERE order_id = '30bdf3d824d824610a49887486debcaf'
GROUP BY product_id
