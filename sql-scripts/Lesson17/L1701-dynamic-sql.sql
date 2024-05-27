USE friends;
GO

-- Dynamic SQL
-- A very common BUT BAD idea from SQLServer Security Perspective
-- https://learn.microsoft.com/en-us/sql/relational-databases/security/sql-server-security-best-practices?view=sql-server-ver16#sql-injection-risks
SELECT * FROM dbo.Friend;
EXEC ('SELECT * FROM dbo.Friend;');

-- It is very common SQL sloppy code using Dynamic SQL
DECLARE @UserInput INT = '6';
SELECT * FROM dbo.Friend WHERE FriendId = 6;
EXEC ('SELECT * FROM dbo.Friend WHERE FriendId = 6;');



