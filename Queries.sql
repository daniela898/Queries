select * from countrylanguage;
select * from country;
select * from city;


/*queries*/


/* 
CREATE TABLE Name_languages_countries 

language countrycode table  countrylanguages

INNER JOIN 

table country code name
*/

-- 1. Retrieve all country names and their official languages.
SELECT name, language FROM country
JOIN countrylanguage ON Country.code = countrylanguage.countrycode;

-- 2. List all cities in Germany along with their population.
SELECT city.Name, city.Population
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Germany';

-- 3. Find the five smallest countries by surface area.
SELECT country.Name, country.SurfaceArea
FROM country
ORDER BY SurfaceArea ASC
LIMIT 5;

-- 4. Find all countries with a population greater than 50 million and sort them in descending order of population.
SELECT country.Name, country.Population
FROM country
WHERE population > 50000000
ORDER BY population DESC;

-- 5. Retrieve the average life expectancy per continent.
SELECT country.Continent, AVG(lifeExpectancy) AS LifeExpectancyPerContinent
FROM country
GROUP BY continent;

-- 6. Calculate the total population per region.
SELECT country.Region, SUM(population) AS TotalPopulation
FROM country
GROUP BY region;

-- 7. Count the number of cities in each country and sort by the highest count.
SELECT city.Name, country.Name, COUNT(city.ID)  AS TotalCities
FROM country
JOIN city ON city.CountryCode = country.Code
GROUP BY 
ORDER BY TotalCities DESC;



-- 8. Display the top 10 largest cities along with their country name.
SELECT city.Name, country.Name, country.Population
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY population DESC
LIMIT 10;

-- 9. Retrieve the names if all countries that have an official language of French.
SELECT country.Code, country.Name, country.Region
FROM country
JOIN countrylanguage ON CountryCode = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- 10. Find all countries where English is spoken, but it is not the official language.
SELECT country.Code, country.Name
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'English'
AND countrylanguage.IsOfficial = 'F';

-- 11. Find countries where the population tripled in the past 50 years (if historical data is available).




-- 12. List the richest and poorest countries in each continent based on GNP (Gross National Product).
SELECT continent.Name AS continentName,
	MAX(country.GNP) AS richestGNP,
	(SELECT country.Name
	FROM country
	WHERE country.GNP = MAX(country.GNP)
	AND country.Continent = continent.Name) AS richestCountry,
	MIN(country.GNP) AS poorestGNP,
	(SELECT country.Name
	FROM country
    WHERE country.GNP = MIN(country.GNP)
	AND country.Continent = continent.Name) AS poorestCountry
 FROM country
 JOIN continent ON country.Continent = continent.Code
 GROUP BY continent.Name;


-- 13. Identify countries with a life expectancy below the global average.
SELECT country.Code, country.Name, country.LifeExpectancy
FROM country
WHERE country.LifeExpectancy < (SELECT AVG(LifeExpectancy) FROM country);


-- Retrieve the capital cities of countries with a population above 100 million.
SELECT city.ID, city.Name AS capitalCity
FROM country
JOIN city ON country.Capital = city.ID
WHERE country.Population > 100000000;


-- 15. Find the continent with the highest number of countries.

