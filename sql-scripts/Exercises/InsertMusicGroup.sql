USE musicefc;
GO

--Create a stored procedure that inserts an MusicGroup into the dbo.MusicGroups table
--Putting it together, return code, default parameters and output parameters with
--Transactions and Error Handling and logging
CREATE OR ALTER PROCEDURE dbo.usp_InsertMusicGroup
    @MusicGroupId UNIQUEIDENTIFIER, -- NULL will create a new GUID
    @Name NVARCHAR(200),
    @EstablishedYear INT,

    --Use an output variable to return ArtistId of inserted, NULL will indicate error
    @InsertedMusicGroupId UNIQUEIDENTIFIER OUTPUT AS

    SET NOCOUNT ON;

    DECLARE @retCode INT;
    SET @InsertedMusicGroupId = NULL;

    BEGIN TRANSACTION    
        BEGIN TRY

            IF @MusicGroupId IS NULL 
                SET @MusicGroupId = NEWID();

            INSERT INTO dbo.MusicGroups VALUES 
                (@MusicGroupId, @Name, @EstablishedYear); 

            COMMIT;

            --Set the output variable after commit, variables are not rolled back
            SET @InsertedMusicGroupId = @MusicGroupId; 
            SET @retCode = 0;

            PRINT @InsertedMusicGroupId;

        END TRY       
        BEGIN CATCH

            ROLLBACK

            --Logg the error   
            INSERT INTO dbo.ErrorLog (err_nr, err_msg, err_line, err_sev)
            VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE(), ERROR_SEVERITY())
            
            --Notify user of stored procedure that it did not succeed
            --Not really needed as I throw an error.
            SET @retCode = 1;           
            THROW 60000, 'Insert Music Group Error', 1;
        END CATCH;
    RETURN @retCode;
GO