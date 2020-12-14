/* Criando tabela produtos */ 

CREATE TABLE produtos (
    codigo INT,
    nome   VARCHAR (100),
    preco  DECIMAL (10, 2) /* numero decimal com 10 digitos com 2 digitos dps da virgulas */ 
);

/* Inserindo produtos 
Cafe esta com '' pois eh informacao textual*/ 
insert into produtos (codigo, nome, preco) values (1, 'cafe', 3.9);

/* inserindo sem preco*, ele completa com NULL*/
insert into produtos (codigo, nome) values (2, 'arroz');

/* Vendo tabela */
select * from produtos

