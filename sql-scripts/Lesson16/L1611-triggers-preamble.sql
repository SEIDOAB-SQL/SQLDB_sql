USE goodfriendsefc;
GO

--When working with triggers is is important to ensure they work properly before moving to actual tables and actual data.
--Create a table for experiement, unfortunatly #temp tables does not work with trigger. 

--housekeeping
DROP TRIGGER IF EXISTS trInsteadInsertFriends;
DROP TRIGGER IF EXISTS trAfterInsertFriends;
DROP TRIGGER IF EXISTS trInsteadDeleteFriends;
DROP TRIGGER IF EXISTS trAfterDeleteFriends;
DROP TRIGGER IF EXISTS trInsteadUpdateFriends;
DROP TRIGGER IF EXISTS trAfterUpdateFriends;


DROP TABLE IF EXISTS [dbo].[tmpFriends];

--Create a table for experiement, unfortunatly #temp tables does not work with trigger. 
--For simplicity I use Azure Data Studio "Script as CREATE" from dbo.Friends as a template
CREATE TABLE [dbo].[tmpFriends](
	[FriendId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[AdressId] [uniqueidentifier] NULL,
	[Birthday] [datetime2](7) NULL,
	[Modified] [datetime] NULL		-- I add this to log when row was modified
	-- differerence between datetime and dateime2
	-- https://learn.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16
) ON [PRIMARY]
GO

--Copy all data into new table
INSERT INTO [dbo].[tmpFriends] 
SELECT *, NULL FROM dbo.Friends; --the ,NULL sets to Modified

--Now we are ready to experiment with triggers

