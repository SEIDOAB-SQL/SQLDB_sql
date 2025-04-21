USE Friends;
GO

--Create an index
CREATE INDEX EmailIdx ON dbo.Friend (Email);

--Show indexes in a table
EXEC sp_helpindex 'dbo.Friend';

-- Show indexes with full details
SELECT * FROM sys.indexes
WHERE object_id = OBJECT_ID('dbo.Friend');

--Delete an index
DROP INDEX EmailIdx ON dbo.Friend;


