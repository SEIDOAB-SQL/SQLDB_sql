USE musicefc;
GO

DECLARE @RetCode INT, @RCount INT;

EXEC @RetCode = dbo.usp_InsertArtist   'Frank', 'Doe', @RCount OUTPUT;
PRINT @RetCode;

EXEC @RetCode = dbo.usp_InsertArtist   'Mary', 'Doe', @RCount OUTPUT;
PRINT @RetCode;

SELECT * FROM dbo.Artists WHERE LastName = 'Doe';