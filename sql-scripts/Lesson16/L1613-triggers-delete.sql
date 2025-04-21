USE goodfriendsefc;
GO

--DELETE Triggers

--INSTEAD OF trigger example
CREATE OR ALTER TRIGGER trInsteadDeleteFriends
ON [dbo].[tmpFriends] INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    --deleted is a temporary in-memory table managed by SQL Server that keeps info about the row to be deleted
    --I use this to deleteion of anyone called Harry Potter
    DELETE FROM [dbo].[tmpFriends] 
    WHERE [dbo].[tmpFriends].FriendId IN (SELECT FriendId From deleted) 
        AND NOT ([dbo].[tmpFriends].FirstName = 'Harry' AND [dbo].[tmpFriends].LastName = 'Potter') ;
END
GO

--AFTER trigger example
CREATE OR ALTER TRIGGER trAfterDeleteFriends
ON [dbo].[tmpFriends] AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    --Deletion is done.
    DECLARE @Count INT;
    DECLARE @City NVARCHAR(200);

    DECLARE friends_cursor CURSOR FAST_FORWARD 
    FOR
        SELECT a.City, COUNT(FriendId) [Count] FROM deleted d
        INNER JOIN dbo.Adress a ON d.AdressId = a.AdressId
        GROUP BY a.City
        ORDER BY 2;

        OPEN friends_cursor;
        FETCH NEXT FROM friends_cursor INTO @City, @Count;

        WHILE @@FETCH_STATUS = 0 BEGIN

            PRINT 'Deleted ' + CAST (@Count AS NVARCHAR) + ' friends in '+ @City;

            FETCH NEXT FROM friends_cursor INTO @City, @Count;
        END

    CLOSE friends_cursor;
    DEALLOCATE friends_cursor;

END
GO


--Let's delete some rows
DELETE FROM [dbo].[tmpFriends] WHERE Email LIKE 'a sweet email%' OR Email LIKE 'cool email%';
SELECT * FROM [dbo].[tmpFriends] WHERE Email LIKE 'a sweet email%' OR Email LIKE 'cool email%';

--Let's delete some rows in a specific city
DELETE f FROM [dbo].[tmpFriends] f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId 
--WHERE a.City = 'Uppsala'

SELECT COUNT(*) FROM [dbo].[tmpFriends] f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId 
--WHERE a.City = 'Uppsala'



--List all triggers
SELECT  name, object_id, schema_id, parent_object_id, type_desc, create_date, modify_date, is_published  
FROM sys.objects  
WHERE type = 'TR';   