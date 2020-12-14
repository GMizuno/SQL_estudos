-- Operador CASE server para substituri o valor de uma coluna por outra
SELECT report_code, year, month, day, wind_speed,
 CASE
 WHEN wind_speed  >= 40 THEN 'HIGH'
 WHEN wind_speed  >= 30 AND wind_speed  < 40 THEN 'MODERATE'
 ELSE 'LOW'
 END as New_speed_cat
from STATION_DATA

-- Poderia fazer
SELECT report_code, year, month, day, wind_speed,
 CASE
 WHEN wind_speed  >= 40 THEN 'HIGH'
 WHEN wind_speed  >= 30 THEN 'MODERATE'
 ELSE 'LOW'
 END as New_speed_cat
from STATION_DATA,

-- Count
SELECT
 CASE
    WHEN wind_speed  >= 40 THEN 'HIGH'
    WHEN wind_speed  >= 30 THEN 'MODERATE'
    ELSE 'LOW'
 END as New_speed_cat,
COUNT(*) FROM STATION_DATA
GROUP BY 1

-- Count per year
SELECT year,
 CASE
    WHEN wind_speed  >= 40 THEN 'HIGH'
    WHEN wind_speed  >= 30 THEN 'MODERATE'
    ELSE 'LOW'
 END as New_speed_cat,
COUNT(*) FROM STATION_DATA
GROUP BY 1, 2

-- Contado quantos dias a temp segundo uma classificação
SELECT 
 CASE
    WHEN temperature >= 80 then 'MUITO CALOR'
    WHEN temperature >= 60 then 'CALOR'
    ELSE 'NORMAL'
 END as new_cat_temp, 
 COUNT(*) FROM STATION_DATA
 GROUP BY 1

-- Contado quantos dias a temp segundo uma classificação
SELECT month,
 CASE
    WHEN temperature >= 80 then 'MUITO CALOR'
    WHEN temperature >= 60 then 'CALOR'
    ELSE 'NORMAL'
 END as new_cat_temp, 
 COUNT(*) FROM STATION_DATA
 GROUP BY 1, 2