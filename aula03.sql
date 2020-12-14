insert into produtos (codigo, nome, preco) values (3, 'maça', 2);
insert into produtos (codigo, nome, preco) values (4, 'pera', 9);
insert into produtos (codigo, nome, preco) values (5, 'martelo', 10);
insert into produtos (codigo, nome, preco) values (6, 'kibe', 3);
insert into produtos (codigo, nome, preco) values (7, 'agua', 3);

SELECT * FROM produtos

/* Fazendo att* de um campo*/
UPDATE produtos SET nome = 'Agua Mineral' WHERE codigo = 7;
    
SELECT * FROM produtos

/* Fazendo att* em + de um campo*/
UPDATE produtos SET nome = 'File', preco = 8.7 WHERE codigo = 6;
    
SELECT * FROM produtos

/* Fazendo att* em + de um produto*/
UPDATE produtos SET preco = 8.7 WHERE codigo in (1,2,3) ;
    
SELECT * FROM produtos

UPDATE produtos SET preco = preco + 1 WHERE codigo in (1,2,3) ;
    
SELECT * FROM produtos

/* Nao funciona*/
UPDATE produtos SET preco = (80, 10, 90) WHERE codigo in (1,2,3) ;
    
SELECT * FROM produtos



