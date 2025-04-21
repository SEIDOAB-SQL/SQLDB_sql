USE goodfriendsefc;
GO

--Create a stored procedure that gets all the friends in a specific city
CREATE OR ALTER PROCEDURE dbo.usp_GetFriends 
    @Country NVARCHAR(200),
    @City NVARCHAR(200) AS

    SELECT f.*, a.City, a.Country FROM dbo.Friends f 
    INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId

    WHERE a.Country = @Country AND a.City = @City

GO

--Executing
EXEC dbo.usp_GetFriends 'Sweden', 'Stockholm';

--House cleaning only for the example
DROP PROCEDURE IF EXISTS dbo.usp_GetFriends;