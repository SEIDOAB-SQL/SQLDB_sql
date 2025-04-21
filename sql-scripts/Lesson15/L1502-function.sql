USE goodfriendsefc;
GO

--CREATE a function to remove whitespace characters and new line characters and trim
CREATE FUNCTION dbo.udf_RemoveDelimiter(@s NVARCHAR(200))
RETURNS NVARCHAR(200) AS
BEGIN
    RETURN TRIM(REPLACE (REPLACE(@s, NCHAR(9), ''), NCHAR(10), ''))
END;
GO

--using SELECT INTO contruct and a temp table let's me avoid declaring a table separatly
SELECT
   MY_XML.Friend.query('FirstName').value('.', 'NVARCHAR(200)') AS FirstName,
   MY_XML.Friend.query('LastName').value('.', 'NVARCHAR(200)') AS LastName,
   MY_XML.Friend.query('Country').value('.', 'NVARCHAR(200)') AS Country,
   MY_XML.Friend.query('Pet').value('.', 'NVARCHAR(200)') AS Pet
INTO #fromXML
FROM (SELECT CAST(MY_XML AS xml)
-- Docker container
 FROM OPENROWSET(BULK N'/usr/images/friends2.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)

-- SQL Server Express
--   FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\friends2.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      
CROSS APPLY MY_XML.nodes('Friend') AS MY_XML (Friend);

--remove some whitespace characters and new line characters using udf_RemoveDelimiter
UPDATE #fromXML
SET FirstName = dbo.udf_RemoveDelimiter(FirstName),
    LastName = dbo.udf_RemoveDelimiter(LastName),
    Country = dbo.udf_RemoveDelimiter(Country),
    Pet = dbo.udf_RemoveDelimiter(Pet);

SELECT * FROM #fromXML;

--Housecleaning
DROP TABLE IF EXISTS #fromXML;
DROP FUNCTION IF EXISTS dbo.udf_RemoveDelimiter;