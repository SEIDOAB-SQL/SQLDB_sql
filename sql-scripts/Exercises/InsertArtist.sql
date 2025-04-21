USE musicefc;
GO

--Let's first create an application Error log table
DROP TABLE IF EXISTS dbo.ErrorLog; --Housecleaning for the example     
CREATE TABLE dbo.ErrorLog(
    err_nr INT,
    err_msg NVARCHAR(400),
    err_line INT,
    err_sev INT);
GO

--Create a stored procedure that inserts an Artist into the dbo.artist table
--Putting it together, return code, default parameters and output parameters with
--Transactions and Error Handling and logging
CREATE OR ALTER PROCEDURE dbo.usp_InsertArtist
    @ArtistId UNIQUEIDENTIFIER, -- NULL will create a new GUID
    @FirstName NVARCHAR(200),
    @LastName NVARCHAR(200),

    --Use an output variable to return ArtistId of inserted, NULL will indicate error
    @InsertedArtistId UNIQUEIDENTIFIER OUTPUT,
    
    --Parameters with default values
    @BirthDay DATETIME = NULL,
    @MusicGroupId UNIQUEIDENTIFIER = NULL  AS

    SET NOCOUNT ON;

    DECLARE @retCode INT;
    SET @InsertedArtistId = NULL;

    BEGIN TRANSACTION    
        BEGIN TRY

            IF @ArtistId IS NULL 
                SET @ArtistId = NEWID();

            INSERT INTO dbo.Artists VALUES 
                (@ArtistId, @FirstName, @LastName, @BirthDay, @MusicGroupId); 

            COMMIT;

            --Set the output variable after commit, variables are not rolled back
            SET @InsertedArtistId = @ArtistId; 
            SET @retCode = 0;

        END TRY       
        BEGIN CATCH

            ROLLBACK

            --Logg the error   
            INSERT INTO dbo.ErrorLog (err_nr, err_msg, err_line, err_sev)
            VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE(), ERROR_SEVERITY())
            
            --Notify user of stored procedure that it did not succeed
            --Not really needed as I throw an error.

            SET @retCode = 1;            
            THROW 60000, 'Insert Artist Error', 1;

        END CATCH;
    RETURN @retCode;
GO