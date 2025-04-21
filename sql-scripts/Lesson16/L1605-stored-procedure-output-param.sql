USE goodfriendsefc;
GO

--Create a stored procedure that gets all the friends in a specific city
--Using parameters with default vaues
CREATE OR ALTER PROCEDURE dbo.usp_GetFriends 
    @Country NVARCHAR(200),
    @City NVARCHAR(200),

    --Use an output variable to return number of rows in the dataset
    @Count INT OUTPUT AS

    SELECT f.*, a.City, a.Country FROM dbo.Friends f 
    INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
    WHERE a.Country = @Country AND a.City = @City

    --@@ROWCOUNT always number of rows affected in last statement
    SET @Count = @@ROWCOUNT; 
GO

--Executing
DECLARE @NrFriends INT
EXEC dbo.usp_GetFriends 'Sweden', 'Stockholm', @NrFriends OUTPUT;

PRINT @NrFriends;

--House cleaning only for the example
DROP PROCEDURE IF EXISTS dbo.usp_GetFriends;