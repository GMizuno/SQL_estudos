-- Total de precitação quando tem ou não tem tornados agrupando por ano e mes
-- Fazendo da forma longa
SELECT year, month, SUM(precipitation) as com_tornado
FROM STATION_DATA 
WHERE tornado = 1
GROUP BY year, month

SELECT year, month, SUM(precipitation) as sem_tornado
FROM STATION_DATA 
WHERE tornado = 0
GROUP BY year, month

-- Juntando as duas querries numa so 
SELECT year, month,
    SUM(
        CASE WHEN tornado = 1 THEN precipitation 
        ELSE 0 -- Usar 0 pois sonar 0 não afeta a soma
        END
        ) AS com_tornado, 
    SUM(
        CASE WHEN tornado = 0 THEN precipitation 
        ELSE 0  -- Usar 0 pois sonar 0 não afeta a soma
        END
        ) AS sem_tornado
FROM STATION_DATA
GROUP BY year, month
ORDER BY year DESC

-- Outro exemplo com MAX
SELECT year, month,
    MAX(
        CASE WHEN tornado = 1 THEN precipitation
        ELSE NULL -- Usar NULL pois NULL não afeta a max
        END
        ) com_tornado, 
    MAX(
        CASE WHEN tornado = 0 THEN precipitation
        ELSE NULL --  Usar NULL pois NULL não afeta a max
        END
        ) sem_tornado
FROM STATION_DATA
GROUP BY YEAR, month

-- Outro exemplo com AVG
SELECT year, month,
    AVG(
        CASE WHEN tornado = 1 THEN precipitation
        ELSE NULL -- Usar NULL pois NULL não afeta a max
        END
        ) com_tornado, 
    AVG(
        CASE WHEN tornado = 0 THEN precipitation
        ELSE NULL --  Usar NULL pois NULL não afeta a max
        END
        ) sem_tornado
FROM STATION_DATA
GROUP BY YEAR, month

-- Exemplo usando operadores logicos 
SELECT month,
    SUM(
        CASE WHEN rain = 1 AND thunder = 1 THEN precipitation
        ELSE 0
        END
        ) as com_chuva_e_trovão,
    SUM(
        -- Lembra da lei de d`morgan
        CASE WHEN rain != 1 OR thunder != 1 THEN precipitation 
        ELSE 0
        END
        ) as sem_chuva_e_trovão
FROM STATION_DATA
GROUP by month

-- Outro exemplo usando operadores logicos 
SELECT month,
    SUM(
        CASE WHEN rain AND thunder THEN precipitation
        ELSE 0
        END
        ) as com_chuva_e_granizo,
    SUM(
        -- Lembra da lei de d`morgan
        CASE WHEN rain  OR thunder THEN precipitation 
        ELSE 0
        END
        ) as sem_chuva_e_granizo
FROM STATION_DATA
GROUP by month





SELECT * FROM STATION_DATA