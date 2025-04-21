USE sakila;
GO

--INSERT using view 
-- ERROR MORE than one base table!
-- ERROR Underlaying table have more columns that needs to be set
INSERT INTO dbo.vwtmp_customer
([cus last name], [cus first name], [cus city], [cus country], [sto id])
VALUES
('Gamgee', 'Severus', 'San Bernardino', 'United States', 1)

