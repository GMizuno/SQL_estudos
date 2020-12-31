-- Tebelas
SELECT * FROM comentario;
SELECT * FROM categoria_produto;
SELECT * FROM likes_por_comentario;
SELECT * FROM likes_por_projeto;
SELECT * FROM projetos;
SELECT * FROM produto;
SELECT * FROM usuario;
SELECT * FROM venda_produto;

-- Subquerie eh um comando que pode substituir JOIN, em alguns casos pode ser necessario a utilização
-- da Subquerie pois JOIN não funciona
-- O 'retorno' de uma subquerie deve ser uma coluna

-- Ex 1 - Criar uma coluna com sub
SELECT 
    P.id, 
    P.nome, 
    P.preco, 
    (
        SELECT
            AVG(P2.preco)
        FROM
            produto P2
    ) as Media_geral
FROM produto P;

-- Tentativa 1
SELECT
    P.id, 
    P.nome, 
    P.preco, 
    AVG(P.preco)
FROM 
    produto P;

-- Tentativa 2
SELECT
    P.id, 
    P.nome, 
    P.preco, 
    AVG(P2.preco)
FROM 
    produto P
INNER JOIN produto P2
ON P.id = P2.id
GROUP BY P.id -- Sem o group by fica igual a tentativa  1

-- Ex 2 - Selecionando os produtos q estao acima da media

SELECT P.id,
    P.nome,
    P.preco,
    (
        SELECT AVG(P2.preco)
        FROM produto P2
    ) as Media
FROM produto P
WHERE P.preco >= (
                    SELECT AVG(P2.preco)
                    FROM produto P2
                )

-- Ex 3 - Trabalhando com mais de uma tabela
SELECT T.*
FROM 
(
    SELECT V.*,
            (
                SELECT AVG(P.preco)
                FROM produto p
            ) as Media
    from venda_produto V
) as T
WHERE T.valor > T.Media

-- Achando quantos produtodos foram vendidos na tabela anterior
SELECT COUNT(T.valor)
FROM 
(
    SELECT V.*,
            (
                SELECT AVG(P.preco)
                FROM produto p
            ) as Media
    from venda_produto V
) as T
WHERE T.valor > T.Media

