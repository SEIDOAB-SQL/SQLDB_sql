USE friends;
GO

--SQL Injection example 1=1 is true
DECLARE @UserInput NVARCHAR(50);

--Intention
SET @UserInput = '6';
SELECT * FROM dbo.Friend WHERE FriendId = 6;
EXEC ('SELECT * FROM dbo.Friend WHERE FriendId = ' + @UserInput + ';');

--Attack
SET @UserInput = '6 OR 1=1';
EXEC ('SELECT * FROM dbo.Friend WHERE FriendId = ' + @UserInput + ';');

--Reason:
SELECT * FROM dbo.Friend WHERE FriendId = 6 OR 1=1;
GO
