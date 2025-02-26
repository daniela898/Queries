
-- Explore the "world" database:
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;
USE WORLD;

-- 1.- Views:
CREATE VIEW high_population_cities AS
SELECT name, countryCode, population
FROM city
WHERE population > 1000000;

CREATE VIEW countries_with_languages AS
SELECT c.name AS country_name, cl.language
FROM country cityc
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.Language != 'English';

-- 2.- Users and Privileges:
CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'password';

	-- Read access (SELECT) on the city and country tables.
    GRANT SELECT ON WORLD.city TO 'db_user'@'localhost';
    GRANT SELECT ON WORLD.country TO 'db_user'@'localhost';
    
    -- Write access (INSERT, UPDATE) on the city table.
GRANT INSERT, UPDATE ON WORLD.city TO 'db_user'@'localhost';

-- Revoke the ability of db_user to modify the country table
REVOKE INSERT, UPDATE, DELETE ON WORLD.country FROM 'db_user'@'localhost';

-- Grant the db_user full access to the high_population_cities view.
GRANT ALL PRIVILEGES ON WORLD.high_population_cities TO 'db_user'@'localhost';

-- 3.- Test Privileges:
-- Log in as db_user and attempt to perform operations according to the granted/revoked privileges
USE WORLD;
SHOW GRANTS FOR 'db_user';
SELECT Name, Continent, Population FROM country WHERE Continent = 'Asia';



