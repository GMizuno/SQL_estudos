-- Contando a quantidade de linhas
SELECT count( * ) 
  FROM station_data;

-- Contando a quantidade de tornados
SELECT count( * ) 
  FROM station_data
 WHERE tornado = 1;

-- contando por ano?
SELECT year,
       count( * ) 
  FROM station_data
 WHERE tornado = 1;
 
-- Agora sim, contando por ano
SELECT year,
       count( * ) 
  FROM station_data
 WHERE tornado = 1
 GROUP BY year;
 
-- contando por ano e mes
SELECT year, month, 
       count( * ) 
  FROM station_data
 WHERE tornado = 1
 GROUP BY year, month;
 
-- Podemos usar possições ordinais 
SELECT year, month, 
       count( * ) 
  FROM station_data
 WHERE tornado = 1
 GROUP BY 1, 2; -- 1 se refere ao year e 2 ao mes
 
 
-- Podemos misutra
SELECT year, month, 
       count( * ) 
  FROM station_data
 WHERE tornado = 1
 GROUP BY 1, month; -- 1 se refere ao year 
 

-- Ordenando por ano 
SELECT year,
       count( * ) 
  FROM station_data
 WHERE tornado = 1
 GROUP BY year
 ORDER BY year;
 
-- Ordenando por ano e mes
SELECT year,
       count( * ) 
  FROM station_data
 WHERE tornado = 1
 GROUP BY year, month
 ORDER BY year, month;

-- Ordenando por ano e mes, usando DESC e ASC (padrao)
SELECT year, month, 
       count( * ) 
  FROM station_data
 WHERE tornado = 1
 GROUP BY year, month
 ORDER BY year DESC, month;

SELECT year, month, 
      count( * ) 
 FROM station_data
WHERE tornado = 1
GROUP BY year, month
ORDER BY month DESC;




