USE friends;
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
 FROM OPENROWSET(BULK N'/tmp/friends2.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)

-- SQL Server Express
--   FROM OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\friends2.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      
CROSS APPLY MY_XML.nodes('Friend') AS MY_XML (Friend);

--depending on your xml you may need to remove som whitespace characters and new line characters
UPDATE #fromXML
SET FirstName = REPLACE (REPLACE(FirstName, NCHAR(9), ''), NCHAR(10), ''),
    LastName = REPLACE (REPLACE(LastName, NCHAR(9), ''), NCHAR(10), ''),
    Country = REPLACE (REPLACE(Country, NCHAR(9), ''), NCHAR(10), ''),
    Pet = REPLACE (REPLACE(Pet, NCHAR(9), ''), NCHAR(10), '')

SELECT * FROM #fromXML;

DROP TABLE #fromXML;