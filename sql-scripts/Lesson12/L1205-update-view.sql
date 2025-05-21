USE sakila;
GO

--Common pitfall when updating through a View
SELECT * FROM tmp_country 
WHERE country = 'Sweden'

SELECT * FROM dbo.vwtmp_customer 
WHERE [cus id] = 1;

--UPDATE using view 
-- The country_id for customer_id 1 will be updated
UPDATE dbo.vwtmp_customer
SET [cus country] = 'Sweden'   
WHERE [cus id] = 1;

--Country Japan no longer in the database, instead double of Sweden
SELECT country, COUNT(*) FROM tmp_country 
WHERE country IN ('Japan', 'Sweden')
GROUP BY country


SELECT [cus country], COUNT(*) FROM vwtmp_customer
WHERE [cus country] IN ('Japan', 'Sweden')
GROUP BY [cus country]


