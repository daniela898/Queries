-- Explore the "world" database:
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;

-- 1.- Comparison Operators:
-- Write a query to find all countries where the population is greater than 50 million but less than 200 million.
SELECT Name, Population 
FROM country
WHERE Population > 50000000 AND Population < 200000000;

-- Use IN to find all countries with population in a specific range (e.g., between 20 million and 50 million).
SELECT Name, Population
FROM country
WHERE Population IN (SELECT Population
					FROM country
                    WHERE Population BETWEEN 200000000 AND 50000000);

-- 2.- Logical Operators:
-- Use the AND, OR, and NOT operators to write a query that retrieves all cities where the population is between 1 million and 10 million, but excludes cities
-- in the "Asia" region.
SELECT Name, Population, CountryCode
FROM city
WHERE Population BETWEEN 1000000 AND 10000000
	AND countryCode NOT IN (SELECT Code FROM country WHERE Region = 'Asia');

-- 3.- Complex Queries:
-- Write a query that retrieves countries where the population is either over 100 million or the region is “Europe”.
SELECT Name, Population, Region
FROM country
WHERE Population > 100000000
	OR Region = 'Europe';

-- Combine LIKE and NOT to find cities with names starting with 'A' but exclude those that end with 'n'
SELECT 	Name, Population, CountryCode
FROM city
WHERE Name LIKE '%A'
	AND Name NOT LIKE '%n';