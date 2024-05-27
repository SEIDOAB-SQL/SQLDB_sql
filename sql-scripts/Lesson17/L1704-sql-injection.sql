USE friends;
GO

--SQL Injection use ; to run several SQL statements
--Lets create a temp table as we dont want to destroy a real table
DROP TABLE IF EXISTS #tmpPet
SELECT * INTO #tmpPet FROM dbo.Pet; 

DECLARE @UserInput NVARCHAR(50);

--Intention
SET @UserInput = '6';
SELECT * FROM dbo.Friend WHERE FriendId = 6;
EXEC ('SELECT * FROM dbo.Friend WHERE FriendId = ' + @UserInput + ';');

--Attack
SET @UserInput = '6; DROP TABLE #tmpPet';
EXEC ('SELECT * FROM dbo.Friend WHERE FriendId = ' + @UserInput + ';');
SELECT * FROM #tmpPet; --does not exist any more

--Reason:
SELECT * FROM dbo.Friend WHERE FriendId = 6; DROP TABLE #tmpPet;
GO

--

