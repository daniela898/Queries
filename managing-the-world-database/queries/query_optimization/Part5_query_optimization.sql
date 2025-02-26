-- Explore the "world" database:
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;


-- 1.- Optimizing a Query:
-- Write a query that retrieves the 10 cities with the highest populations. (This will involve sorting and limiting the results.
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

-- Investigate the performance of this query by running EXPLAIN on the query plan and observing what indexes are being used.
EXPLAIN
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

-- Rewrite the query using LIMIT and an appropriate index optimize perfomance.

CREATE INDEX indx_population ON city(Population);

SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

-- 2.- Using Indexes for Optimized Search:
-- Write a query that searches for all cities with a population greater than 1 million and a name starting with "A". Ensure that the query is optimize using indexing.
SELECT Name, Population
FROM city
WHERE Population > 1000000
AND Name LIKE 'A%'; 

