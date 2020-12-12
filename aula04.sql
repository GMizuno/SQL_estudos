/* removendo um produto
drop != de delete,
drop remove a tabela toda*/

/*ATENCAO; se nao colocar where toda a tabela sera deletada*/
delete from produtos where codigo = 5
select * from produtos;

/* deletando + de um registro*/
delete from produtos where codigo in (6,7,8);
select * from produtos;

/* deletando com uma condicao*/
delete from produtos where preco < 5.1;
/* delete from produtos where preco <= 5.1*/;
select * from produtos;

/* removendo null*/
delete from produtos where preco is null;
select * from produtos;

