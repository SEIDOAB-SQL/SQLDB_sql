USE sakila;
GO

--a bit of house cleaning
DROP TABLE IF EXISTS dbo.tmp_customer;
DROP TABLE IF EXISTS dbo.tmp_address;
DROP TABLE IF EXISTS dbo.tmp_city;
DROP TABLE IF EXISTS dbo.tmp_country;
DROP VIEW IF EXISTS dbo.vwtmp_customer;

--let's first create a copy of tables we can play around with
SELECT * INTO dbo.tmp_customer FROM dbo.customer;
SELECT * INTO dbo.tmp_address FROM dbo.address;
SELECT * INTO dbo.tmp_city FROM dbo.city;
SELECT * INTO dbo.tmp_country FROM dbo.country;
GO

--Now, lets create a view based on the tmp tables
CREATE VIEW dbo.vwtmp_customer AS
--ALTER VIEW dbo.vw_customer AS
    SELECT c.customer_id [cus id], c.last_name [cus last name], c.first_name [cus first name],
        ci.city[cus city], cty.country [cus country], 
        c.store_id [sto id]
    FROM dbo.tmp_customer AS c
    
    --work out inner joins for customer -> address -city - >country
    INNER JOIN dbo.tmp_address AS a ON c.address_id = a.address_id
    INNER JOIN dbo.tmp_city AS ci ON a.city_id = ci.city_id
    INNER JOIN dbo.tmp_country AS cty ON ci.country_id = cty.country_id;
GO

--verify VIEW works fine
SELECT TOP 5 * FROM dbo.vwtmp_customer;

--Start the dangerous stuff
BEGIN TRAN

--Danger 1
--UPDATE using view - ONE base table, i.e. tmp_customer
UPDATE dbo.vwtmp_customer
SET [cus first name] = 'VOLDEMORT',
    [cus last name] = 'BAGGINS'
WHERE [cus id] = 1;

-- Now I can roll back to here
SELECT * FROM dbo.vwtmp_customer WHERE [cus id] = 1;
SAVE TRANSACTION NameUpdated 

--Danger 2
--UPDATE using view the country_id for customer_id 1 will be updated
UPDATE dbo.vwtmp_customer
SET [cus country] = 'Sweden'   
WHERE [cus id] = 1;

--Country Japan no longer in the database, instead double of Sweden
-- Now I can roll back to here
SELECT * FROM tmp_country WHERE country = 'Sweden' OR country = 'Japan'
SAVE TRANSACTION CountryUpdated

--Rollback to first savepoint
ROLLBACK TRANSACTION NameUpdated

SELECT * FROM dbo.vwtmp_customer WHERE [cus id] = 1;
SELECT * FROM tmp_country WHERE country = 'Sweden' OR country = 'Japan'

--All good man! Commit
COMMIT TRAN
