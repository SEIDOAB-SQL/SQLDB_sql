USE friends;
GO

-- View collation of the SQL Server
SELECT CONVERT (varchar(256), SERVERPROPERTY('collation'));  
-- or
EXECUTE sp_helpsort;  
GO

-- view the collation setting of a database
SELECT name, collation_name FROM sys.databases;  
-- or
SELECT CONVERT (varchar(256), DATABASEPROPERTYEX('friends','collation')) AS collation_name; 
GO

-- view the collation settings for tables and columns
SELECT t.name TableName, c.name ColumnName, collation_name  
FROM sys.columns c  
inner join sys.tables t on c.object_id = t.object_id;  

