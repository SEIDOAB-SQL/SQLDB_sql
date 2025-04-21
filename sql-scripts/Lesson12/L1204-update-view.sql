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

--UPDATE using view - ONE base table, i.e. tmp_customer
UPDATE dbo.vwtmp_customer
SET [cus first name] = 'VOLDEMORT',
    [cus last name] = 'BAGGINS'
WHERE [cus id] = 1;

--verify UPDATE
SELECT TOP 5 * FROM dbo.vwtmp_customer;