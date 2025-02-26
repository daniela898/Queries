-- Explore the "world" database:
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;


-- 1.- Internal Composition:
-- Write a subquery that lists countries that have more that 5 cities with a population greater that 1 million.
SELECT country.Code, country.Name
FROM country
JOIN city ON country.Code = city.CountryCode
    WHERE city.Population > 1000000
    GROUP BY country.Code, country.Name
    HAVING COUNT(city.ID) > 5;

-- Use a subquery in the WHERE clause to find all countries with more than 3 official languages
SELECT country.Code, country.Name
FROM country
WHERE country.Code IN (
	SELECT country.Code
	FROM countrylanguage cl
    WHERE cl.IsOfficial = 'T'
    GROUP BY country.Code
    HAVING COUNT(cl.Language) > 3
);

-- 2.- External Composition:
-- Write a query that joins city, country, and country languages to find cities with at least one official language spoken that is not English.
SELECT DISTINCT city.Name AS City, country.Name AS Country 
FROM city
JOIN country ON Country.Code = Country.Code
JOIN countrylanguage cl ON Country.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
AND cl.language != 'English';

-- Use a derivated table to calculate the total population of each country (i.e., sum the populations of all cities in each country).
 SELECT Country.Name AS Country, SUM(city.Population) AS TotalPopulation
 FROM country
 JOIN city ON Country.Code = Country.Code
 GROUP BY Country.Name;

 
 
 
 