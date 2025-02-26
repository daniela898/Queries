-- Explore the "world" database:
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;

-- Objetive: To practice working with transactions to ensure atomicity, consistency, isolation, and durability (ACID properties)
-- 1.- Basic Transaction:
-- Start a transaction and insert a new city into the city table. Rollback the transaction after checking the inserted data.
START TRANSACTION;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('Test City', 'ESP', 'Madrid', 1000001);
SELECT * FROM city WHERE Name = 'Madrid';

ROLLBACK;

-- 2.- Multiple Operations in a Transaction:
-- Being a transaction that inserts a new city into the city and updates the population of an existing country table. 
-- Commit the transaction only if both operations are successfull. If any operation fails, rollback the transaction.
START TRANSACTION;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('TestCity', 'ESP', 'Madrid', 2000000);
UPDATE country
SET Population = Population + 2000000
WHERE Code = 'ESP';
SELECT * FROM city WHERE Name = 'Madrid';
SELECT Name, Population FROM country WHERE Code = 'ESP';

ROLLBACK;

-- 3.- Transaction Management:
-- Use SAVEPOINT and ROLLBACK TO SAVEPOINT to manage partial rollbacks during the transaction.
START TRANSACTION;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('NewCity', 'FRA', 'Paris', 2000000);

SAVEPOINT before_update;

UPDATE country
SET Population = Population + 2000000
WHERE Code = 'FRA';

SAVEPOINT after_update;
SELECT * FROM city WHERE Name = 'Fra';

SELECT Name, Population FROM country WHERE Code = 'FRA';

ROLLBACK TO SAVEPOINT before_update;

-- Create a situation where you simulate an error in the middle of a transaction to show how rollback works.
START TRANSACTION;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('NewCity', 'ESP', 'Madrid', 5000000);


UPDATE country
SET Population = Population + 5000000
WHERE Code = 'ESP';

UPDATE country
SET Population = Population + 1000000
WHERE Code = 'XYZ';  -- 'XYZ' is a country code that doesn't exist

ROLLBACK;
SELECT * FROM city WHERE Name = 'NewCity';  -- Should return no rows
SELECT Name, Population FROM country WHERE Code = 'ESP';  -- Population should be unchanged