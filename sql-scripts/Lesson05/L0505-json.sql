USE friends;
GO

--using SELECT INTO contruct and a temp table let's me avoid declaring a table separatly
SELECT friend.* 
INTO #fromJSON
FROM
-- Docker container
OPENROWSET(BULK N'/tmp/friends3.json', SINGLE_CLOB) AS json

-- SQL Server Express
-- OPENROWSET(BULK N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\friends3.json', SINGLE_CLOB) AS json

 CROSS APPLY OPENJSON(BulkColumn)
 WITH(
    FriendId int, FirstName NVARCHAR(200), LastName NVARCHAR(200), 
    Country NVARCHAR(200), Pet NVARCHAR(200)) AS friend

SELECT * FROM #fromJSON

--DROP TABLE #fromJSON;


--Using the json data read to update the tables
--1. Always test first by creating a tmp table copy
SELECT * INTO #tmpFriend FROM Friend
SELECT * FROM #tmpFriend

--2. Update the tmp table with the json data, bulk read
UPDATE tf
    SET tf.FirstName = js.FirstName
FROM #tmpFriend tf
INNER JOIN #fromJSON js ON tf.FriendId = js.FriendId

--3. Check result
SELECT * FROM #tmpFriend


DROP TABLE #fromJSON;
DROP TABLE #tmpFriend