insert into produtos (codigo, nome, preco) values (8, 'maça', 2);
insert into produtos (codigo, nome, preco) values (9, 'pera', 9);
insert into produtos (codigo, nome, preco) values (10, 'martelo', 10);
insert into produtos (codigo, nome, preco) values (11, 'kibe', 3);
insert into produtos (codigo, nome, preco) values (12, 'agua', 3);

/* selecionando nome e preco*/
select nome, preco from produtos
select preco, nome from produtos

/* selecionando com uma condicao*/
select nome, preco from produtos where codigo = 10
select nome, preco from produtos where codigo in (10, 1, 8)

/*note qu 15 nao existe*/
select nome, preco from produtos where codigo in (10, 1, 8, 15)

/*usando o operador not in*/
select nome, preco from produtos where codigo not in (10, 1, 8)

/*usando o operador between*/
select * from produtos where preco between 3.2 and 9.7

/*usando o operador like*/
select * from produtos where nome like 'agua'

/*retorne os produtos q começam com ag*/
select * from produtos where nome like 'ag%'

/*retorne os produtos q terminam com a*/
select * from produtos where nome like '%a'

/*retorne os produtos pussuem letra a*/
select * from produtos where nome like '%a%';
select * from produtos where nome like '%ag%';
