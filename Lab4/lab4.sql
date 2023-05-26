SELECT UPPER(name) 
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;

SELECT name, LENGTH(name) AS length_name
FROM cities
WHERE LENGTH(name) NOT IN (8, 9, 10)
ORDER BY length_name;

SELECT region, SUM(population) AS sum_population
FROM cities
WHERE region IN ('C', 'S')
GROUP BY region;

SELECT AVG(population) AS avg_population
FROM cities
WHERE region = 'W';

SELECT COUNT(id) AS count_cities
FROM cities
WHERE region = 'E';