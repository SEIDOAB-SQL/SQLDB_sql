USE goodfriendsefc;
GO

--Create a stored procedure that gets all the friends in a specific city
--Putting it together, return code, default parameters and output parameters
CREATE OR ALTER PROCEDURE dbo.usp_GetFriends 
    @Country NVARCHAR(200) = NULL,
    @City NVARCHAR(200) = NULL,

    --Use an output variable to return number of rows in the dataset
    @Count INT OUTPUT AS

    SELECT f.*, a.City, a.Country FROM dbo.Friends f 
    INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
    WHERE (@Country IS NULL OR a.Country = @Country) AND (@City IS NULL OR a.City = @City)

    --@@ROWCOUNT always number of rows affected in last statement
    SET @Count = @@ROWCOUNT; 

    RETURN 0;
GO

--CREATE a function, once created use ALTER to change
CREATE OR ALTER FUNCTION dbo.udf_FullName(@fn NVARCHAR(200), @ln NVARCHAR(200))
RETURNS NVARCHAR(400) AS
BEGIN
    RETURN CONCAT_WS(' ', @fn, @ln)
END;
GO

CREATE OR ALTER FUNCTION dbo.udf_ExecutionSuccess(@ret_code INT, @rows INT)
RETURNS NVARCHAR(200) AS
BEGIN
    DECLARE @sRET NVARCHAR(200);
    IF @ret_code = 0  
        SET @sRet = 'Procedure executed successfully. ' + CAST(@rows AS VARCHAR) + ' friends found';
    ELSE
        SET @sRet = 'Error executing stored procedure';

    RETURN @sRET;
END;
GO

--This time not dropping them, as they will be used further

