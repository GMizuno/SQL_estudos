-- Usando a base olist.DATABASE

-- OBJETIVO
-- Qual o produto + caro que o seller já vendeu, considere pedidos entregues

-- Problema, como resolver isso ?
SELECT seller_id, product_id, COUNT(*) as Qtd_produto, SUM(price) as Receita
FROM tb_orders as pedidos

LEFT JOIN tb_order_items as itens
ON pedidos.order_id = itens.order_id

WHERE order_status = 'delivered'
GROUP BY seller_id, product_id
ORDER BY seller_id;

-- Resolvendo, mas não é a forma mais adequada
WITH tb_seller_prod as ( 
    SELECT seller_id, product_id, COUNT(*) as Qtd_produto, SUM(price) as Receita
    FROM tb_orders as pedidos

    LEFT JOIN tb_order_items as itens
    ON pedidos.order_id = itens.order_id

    WHERE order_status = 'delivered'
    GROUP BY seller_id, product_id
    ORDER BY seller_id
),
tb_seller_max AS (
    SELECT seller_id, MAX(Qtd_produto) as max_qtd
    FROM tb_seller_prod
    GROUP BY seller_id
)

select *
from tb_seller_max 
left join tb_seller_prod
on tb_seller_max.seller_id = tb_seller_prod.seller_id
and tb_seller_max.max_qtd = tb_seller_prod.Qtd_produto 

select * from tb_seller_prod;

-- Resolvendo usando Window Function
WITH tb_seller_prod as ( 
    SELECT seller_id, product_id, COUNT(*) as Qtd_produto, SUM(price) as Receita
    FROM tb_orders as pedidos

    LEFT JOIN tb_order_items as itens
    ON pedidos.order_id = itens.order_id

    WHERE order_status = 'delivered'
    GROUP BY seller_id, product_id
    ORDER BY seller_id
),
tb_seller_order as (
    SELECT *, 
        row_number() OVER(PARTITION BY seller_id
                          ORDER BY Qtd_produto DESC, Receita DESC) as Order_qtd
    FROM tb_seller_prod 

    ORDER BY seller_id
)

SELECT * FROM tb_seller_order

SELECT seller_id, product_id, Qtd_produto
FROM tb_seller_order
WHERE Order_qtd = 1

-- Pegando os 5 + vendidos
WITH tb_seller_prod as ( 
    SELECT seller_id, product_id, COUNT(*) as Qtd_produto, SUM(price) as Receita
    FROM tb_orders as pedidos

    LEFT JOIN tb_order_items as itens
    ON pedidos.order_id = itens.order_id

    WHERE order_status = 'delivered'
    GROUP BY seller_id, product_id
    ORDER BY seller_id
),
tb_seller_order as (
    SELECT *, 
        row_number() OVER(PARTITION BY seller_id
                          ORDER BY Qtd_produto DESC, Receita DESC) as Order_qtd
    FROM tb_seller_prod 

    ORDER BY seller_id
)

SELECT seller_id, product_id, Qtd_produto
FROM tb_seller_order
WHERE Order_qtd <= 5

-- Tempo entre vendas dos sellers, considere pedidos entregues
WITH tb_seller_order as (
    SELECT tb_orders.order_id, 
           date(tb_orders.order_approved_at) AS data_venda, 
           tb_order_items.seller_id

    FROM tb_orders

    LEFT JOIN tb_order_items 
    ON tb_orders.order_id = tb_order_items.order_id

    WHERE order_status = 'delivered'
),
tb_seller_order_sort AS (
    SELECT *,
    -- Removendo linhas duplicadas do mesmo dia de venda
           row_number() OVER (PARTITION BY seller_id, data_venda) AS date_seller_order 
    FROM tb_seller_order
),
tb_seller_lag_data AS (
    SELECT order_id, seller_id, data_venda,
    -- Criando uma coluna com lag das vendas
           lag(data_venda) OVER (PARTITION BY seller_id ORDER BY data_venda) AS lag_data_venda
    FROM tb_seller_order_sort
    WHERE date_seller_order = 1
)

SELECT seller_id, AVG( julianday(data_venda) - julianday(lag_data_venda) ) AS avg_dif_dias
FROM tb_seller_lag_data

GROUP BY seller_id
HAVING avg_dif_dias IS NOT NULL

--ORDER BY avg_dif_dias ASC
