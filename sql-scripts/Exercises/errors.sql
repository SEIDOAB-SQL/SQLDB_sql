USE musicefc;
GO

CREATE OR ALTER PROCEDURE dbo.usp_InsertArtist
    @FirstName NVARCHAR(200),
    @LastName NVARCHAR(200),
    @Count INT OUTPUT,

    @BirthDay DATETIME = NULL,
    @MusicGroupId UNIQUEIDENTIFIER = NULL

AS

    DECLARE @RetCode INT = 0;
    BEGIN TRY

        BEGIN TRANSACTION

        INSERT INTO dbo.Artists
        VALUES ('hello', @FirstName, @LastName, @BirthDay, @MusicGroupId);

        COMMIT;
        
        SET @RetCode = 0;
        SET @Count = @@ROWCOUNT;

    END TRY

    BEGIN CATCH
    
    ROLLBACK;
        
        --You can put some corrective in place, such as your application logging   
        INSERT INTO dbo.ErrorLog (err_nr, err_msg, err_line, err_sev)
        VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE(), ERROR_SEVERITY())

        SET @RetCode = 1;
        SET @Count = 0;

    END CATCH

    RETURN @RetCode;

GO

SELECT * FROM dbo.Artists WHERE LastName = 'Doe';