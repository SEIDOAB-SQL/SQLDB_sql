USE sakila;
GO

--DELETE using view - ERROR MORE than one base table!
DELETE FROM dbo.vwtmp_customer
WHERE [cus id] = 1;

