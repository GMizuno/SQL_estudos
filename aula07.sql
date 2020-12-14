-- Medindo a quantidade de neve q caiu

SELECT count(snow_depth) as Nivel_Neve
FROM STATION_DATA;

-- OBS; As funções de agregação nunca contam NULL 

-- Temperatura média por mes
SELECT month, AVG(temperature) as med_temp
FROM STATION_DATA
GROUP BY month;

-- Temperatura média por mes, dps de 2000
SELECT month, AVG(temperature) as med_temp
FROM STATION_DATA
WHERE year >= 2000
GROUP BY month;

-- Temperatura média por mes, dps de 2000 e e que tenham tornados
SELECT month, AVG(temperature) as med_temp
FROM STATION_DATA
WHERE year >= 2000 AND tornado = 1
GROUP BY month;

-- Temperatura média por mes, dps de 2000 e e que tenham tornados
-- usando round
SELECT month, ROUND(AVG(temperature), 2) as med_temp
FROM STATION_DATA
WHERE year >= 2000 AND tornado = 1
GROUP BY month;

-- Temperatura média, max e min por mes, dps de 2000 e e que tenham tornados
SELECT month, 
 ROUND(MAX(temperature), 2) as max_temp,
 ROUND(MIN(temperature), 2) as min_temp, 
 ROUND(AVG(temperature), 2) as med_temp
FROM STATION_DATA
WHERE year >= 2000 AND tornado = 1
GROUP BY month;

-- Usando HAVING
-- Having serve para filtrar agregações, igual ao Where.
-- Ver exemplo que não funciona 
SELECT month, AVG(temperature) as med_temp
FROM STATION_DATA 
WHERE med_temp >= 40
GROUP BY month;

-- Usando Having
SELECT month, AVG(temperature) as med_temp
FROM STATION_DATA 
GROUP BY month
HAVING med_temp >= 40;

-- Contando quantos dias a temp passou de 40unidades por mes
SELECT month, year, count(*)
FROM STATION_DATA 
GROUP BY month
HAVING temperature >= 40

SELECT month, year, day, temperature 
from STATION_DATA
where year = 1976 and month = 1
ORDER BY day ASC


