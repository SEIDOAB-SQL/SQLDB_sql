USE goodfriends;
GO

-- DANGER!
-- Here is a dangerous stored procedure, but convenient when you are developing and want to 
-- remove test data and re-populate from EntityFrameworkCore.

CREATE PROCEDURE dbo.udp_DeleteAllData
AS

    DELETE FROM dbo.Pets;
    DELETE FROM dbo.Friends;
    DELETE FROM dbo.Adress;
GO


EXEC dbo.udp_DeleteAllData;