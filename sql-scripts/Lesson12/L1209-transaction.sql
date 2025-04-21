USE sakila;
GO

--let's first create a copy of tables we can play around with
DROP TABLE IF EXISTS dbo.tmp_customer;
SELECT * INTO dbo.tmp_customer FROM dbo.customer;

--Check som first names
SELECT TOP 5 first_name FROM dbo.tmp_customer;

--Now I am going to do something that ca go wrong, within a transaction
BEGIN TRAN
--I have done an error in the UPDATE
UPDATE dbo.tmp_customer
SET first_name = 'VOLDEMORT';

--all customers are now called VOLDEMORT - no way back Aahhh!
SELECT TOP 5 first_name FROM dbo.tmp_customer;

--roll back the UPDATE
ROLLBACK TRAN;

--All good man!
SELECT TOP 5 first_name FROM dbo.tmp_customer;
GO
