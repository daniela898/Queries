
-- 1. Explore the "world" database:

SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;

-- 2. Modify Data Types:
ALTER TABLE city
ADD COLUMN is_population_large BOOLEAN;

UPDATE city
SET is_population_large = CASE
	WHEN population > 1000000 THEN TRUE 
    ELSE FALSE
    END;
    
    ALTER TABLE country
    ADD COLUMN regionCode CHAR(3) DEFAULT 'NA';
    
    
    -- 3.- Add Validation Constraints:
    ALTER TABLE city
    ADD CONSTRAINT chk_population_positive
    CHECK (population >= 0);
    
	ALTER TABLE country
    ADD CONSTRAINT uq_country_code UNIQUE (code);
    
    
    -- 4.- Indexes:
   CREATE INDEX idx_city_name ON city (name);
    
    
