USE goodfriendsefc;
GO

--INSERT Triggers

--INSTEAD OF trigger fires before any constraint check, e.g., not null in FriendId
--I can use this trigger to create a GUID
CREATE OR ALTER TRIGGER trInsteadInsertFriends
ON [dbo].[tmpFriends] INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    --inserted is a temporary in-memory table managed by SQL Server that keeps info about the row to be inserted
    INSERT INTO [dbo].[tmpFriends] (FriendId, FirstName, LastName, Email, AdressId, Birthday)
    SELECT NEWID(), FirstName, LastName, Email, AdressId, Birthday FROM inserted; 
    PRINT 'Trigger inserted ' + CAST (@@ROWCOUNT AS NVARCHAR) + ' rows';
END
GO

--AFTER trigger fires after the row is inserted
--I can use this trigger to UPDATE any value in the database. For example replace NULL in an email adress
CREATE OR ALTER TRIGGER trAfterInsertFriends
ON [dbo].[tmpFriends] AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[tmpFriends]
    SET Email = 'a sweet email for ' + i.FirstName
    FROM inserted i
    --Note the WHERE clause, using a Subquery
    WHERE [dbo].[tmpFriends].Email IS NULL AND [dbo].[tmpFriends].FriendId IN (SELECT FriendId FROM inserted) 
END
GO

--Let's insert some values
INSERT INTO [dbo].[tmpFriends] (FirstName, LastName)
VALUES ('Harry','Potter'), ('Tom','Bagger');

INSERT INTO [dbo].[tmpFriends] (FirstName, LastName, Email)
VALUES ('Hermonie','Granger', 'cool email'), ('Frodo','Baggins', 'cool email');

SELECT * FROM [dbo].[tmpFriends] WHERE Email LIKE 'a sweet email%' OR Email LIKE 'cool email%';
--DELETE FROM [dbo].[tmpFriends] WHERE Email LIKE 'a sweet email%' OR Email LIKE 'cool email%';


--List all triggers
SELECT  name, object_id, schema_id, parent_object_id, type_desc, create_date, modify_date, is_published  
FROM sys.objects  
WHERE type = 'TR';   