-- Inner Join
SELECT * 
FROM CUSTOMER INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID

-- Usando alias
SELECT * 
FROM CUSTOMER C INNER JOIN CUSTOMER_ORDER C_OR
ON C.CUSTOMER_ID = C_OR.CUSTOMER_ID

SELECT * FROM CUSTOMER

-- Left Join
SELECT * 
FROM CUSTOMER C LEFT JOIN CUSTOMER_ORDER C_OR
ON C.CUSTOMER_ID = C_OR.CUSTOMER_ID

-- Trocando as posições entre CUSTOMER e CUSTOMER_ORDER s
SELECT * 
FROM CUSTOMER_ORDER C_OR LEFT JOIN CUSTOMER C
ON C.CUSTOMER_ID = C_OR.CUSTOMER_ID
-- Note que não temos null
-- A ordem ficou diferente mas as saidas são iguais
-- OBS: SQlite não suporta rigth e full  join

-- Achando a quatidade produtos vendidos por empresa
SELECT CUSTOMER.CUSTOMER_ID, NAME, ORDER_QTY, PRICE
FROM CUSTOMER_ORDER 

INNER JOIN CUSTOMER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
INNER JOIN PRODUCT
ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID

-- Achando o lucro de cada empresa
SELECT CUSTOMER.CUSTOMER_ID, NAME, SUM(ORDER_QTY * PRICE)
FROM CUSTOMER
INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
INNER JOIN PRODUCT
ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID
GROUP BY NAME

-- left join vs inner join
SELECT CUSTOMER.CUSTOMER_ID, NAME, 
    SUM(ORDER_QTY * PRICE) AS Lucro
FROM CUSTOMER
LEFT JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
LEFT JOIN PRODUCT
ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID
GROUP BY NAME

-- Melhorando um pouco
SELECT CUSTOMER.CUSTOMER_ID, NAME,
 COALESCE(SUM(ORDER_QTY * PRICE), 0) AS Lucro
FROM CUSTOMER
LEFT JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
LEFT JOIN PRODUCT
ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID
GROUP BY NAME

SELECT * FROM PRODUCT
SELECT * FROM CUSTOMER_ORDER
SELECT * FROM CUSTOMER
