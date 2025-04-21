SELECT 1;    --Litteral
SELECT 'Hello'; --String
SELECT 3+5*6; --Expression
SELECT POWER (4, 2); --Function
SELECT @@VERSION; --Global variable
SELECT SERVERPROPERTY('productversion'), SERVERPROPERTY ('productlevel'), SERVERPROPERTY ('edition'); -- Function
GO

--Local variable
DECLARE @myLocal INT = 5;
SELECT @myLocal*3;
GO


SELECT SERVERPROPERTY('productversion') AS Version, SERVERPROPERTY ('productlevel') AS Level, SERVERPROPERTY ('edition') AS Edition;

GO