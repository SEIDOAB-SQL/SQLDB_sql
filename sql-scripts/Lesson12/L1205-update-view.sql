USE sakila;
GO

--Common pitfall when updating through a View
SELECT * FROM tmp_country WHERE country = 'Japan'

--UPDATE using view 
-- The country_id for customer_id 1 will be updated
UPDATE dbo.vwtmp_customer
SET [cus country] = 'Sweden'   
WHERE [cus id] = 1;

--Country Japan no longer in the database, instead double of Sweden
SELECT * FROM tmp_country WHERE country = 'Sweden'

