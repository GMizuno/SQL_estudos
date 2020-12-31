-- Ex: 01
SELECT  nome_time
FROM times
ORDER By nome_time ASC

-- Ex: 02
SELECT nome_time as Time,
       nome_estado as Estado
FROM times
LEFT JOIN times_estados 
ON times.id = times_estados.id_time
LEFT JOIN estados
ON estados.id = times_estados.id_estado

-- Ex: 03 - Solução 1
SELECT nome_estado as Estado,
       COUNT(id_time) as Quantidade
FROM estados
LEFT JOIN times_estados
ON estados.id = times_estados.id_estado

GROUP BY Estado

-- Ex: 03 - Solução 2
SELECT nome_estado as Estado,
       COUNT(id_time) as Quantidade
FROM times
LEFT JOIN times_estados 
ON times.id = times_estados.id_time
LEFT JOIN estados
ON estados.id = times_estados.id_estado

GROUP BY Estado

-- Ex: 04
SELECT nome_estado AS Estado,
       `gols pró` as GP
FROM times
LEFT JOIN times_estados 
ON times.id = times_estados.id_time
LEFT JOIN estados
ON estados.id = times_estados.id_estado

GROUP BY Estado
ORDER BY GP DESC

-- Ex: 05
SELECT nome_estado AS Estado,
       pontos as Pontos
FROM times
LEFT JOIN times_estados 
ON times.id = times_estados.id_time
LEFT JOIN estados
ON estados.id = times_estados.id_estado

GROUP BY Estado
ORDER BY Pontos DESC

-- Ex: 06
SELECT nome_estado AS Estado,
       COUNT(nome_time) AS quant_times,
       pontos/COUNT(nome_time) AS Pontos_por_time
FROM times
LEFT JOIN times_estados 
ON times.id = times_estados.id_time
LEFT JOIN estados
ON estados.id = times_estados.id_estado

GROUP BY Estado
ORDER BY Pontos_por_time DESC

-- Ex: 07 - Solução 1, mais trabalhosa
-- Descobrindo como ficou classificação
SELECT * 
FROM times
ORDER BY pontos DESC

-- pontos >= 77 - Libertadores 
-- pontos >= 57 - Sula
-- pontos <= 29 - Rebaixado

SELECT nome_time, pontos,
CASE 
 WHEN pontos >= 77 THEN 'Libertadores'
 WHEN pontos >= 57 THEN 'Sulamericana'
 WHEN pontos <= 29 THEN 'Rebaixado'
 ELSE 'Copa do Brasil'
END AS Situacao, `gols pró`, `gols contra`
FROM times
ORDER BY pontos DESC

-- Ex: 07 - Solução 2, soluções inteligente 
SELECT *,
CASE 
    WHEN id IN (
        SELECT id 
        FROM times 
        ORDER by pontos DESC LIMIT 6
    ) THEN 'Libertadores'
    WHEN id IN (
        SELECT id 
        FROM times 
        ORDER by pontos DESC LIMIT 6 OFFSET 6
    ) THEN 'Sulamericana'
    WHEN id IN (
        SELECT id 
        FROM times 
        ORDER by pontos DESC LIMIT 4 OFFSET 12
    ) THEN 'Copa do Brasil'
    ELSE 'Rebaixado'
END AS Situacao
FROM times
ORDER BY pontos DESC

-- Bases
SELECT * FROM times
SELECT * FROM times_estados
SELECT * FROM estados
