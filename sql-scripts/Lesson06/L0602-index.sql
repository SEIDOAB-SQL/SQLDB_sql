USE Friends;
GO

--Create an unique multicolumn index, this ensures addresses are nut duplicated
CREATE UNIQUE INDEX UniqueIdx_Address_Street ON dbo.Address (StreetAddress, ZipCode, City, Country);
CREATE INDEX Address_Country ON dbo.Address (Country, City);
CREATE INDEX Address_City ON dbo.Address (City, Country);

--Show indexes in a table
EXEC sp_helpindex 'dbo.Address';

-- Show indexes with full details
SELECT * FROM sys.indexes
WHERE object_id = OBJECT_ID('dbo.Address');

--Delete an index
DROP INDEX UniqueIdx_Address_Street ON dbo.Address;
DROP INDEX Address_Country ON dbo.Address;
DROP INDEX Address_City ON dbo.Address;

