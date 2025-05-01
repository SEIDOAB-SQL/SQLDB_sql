USE musicefc;
GO

--Lets execute usp_InsertMusicGroup and usp_InsertArtist wit and without errors
DECLARE @ret_code INT;
DECLARE @MusicGroupId UNIQUEIDENTIFIER;
DECLARE @ArtisId UNIQUEIDENTIFIER;

    BEGIN TRY

        --This will case an error on the 2nd try as duplicate MusicGroupId
        --EXEC @ret_code = dbo.usp_InsertMusicGroup 'b8ac2b32-2c0d-408e-b418-266e13a3f8be', 'The Doe family', 2023,  @MusicGroupId OUTPUT;

        EXEC @ret_code = dbo.usp_InsertMusicGroup NULL, 'The Doe family', 2023,  @MusicGroupId OUTPUT;
        
        -- This will casue an error
        --SET @MusicGroupId = NEWID();

        EXEC @ret_code = dbo.usp_InsertArtist NULL, 'John', 'Doe',  @ArtisId OUTPUT, NULL, @MusicGroupId;
        EXEC @ret_code = dbo.usp_InsertArtist NULL, 'Mary', 'Doe',  @ArtisId OUTPUT, NULL, @MusicGroupId;
        EXEC @ret_code = dbo.usp_InsertArtist NULL, 'Kim', 'Doe',  @ArtisId OUTPUT, NULL, @MusicGroupId;

    END TRY
    
    BEGIN CATCH
        PRINT 'An error has occurred.'
        PRINT ERROR_NUMBER();
        PRINT ERROR_MESSAGE();
        PRINT ERROR_LINE();
        PRINT ERROR_SEVERITY();
    END CATCH;    
    
    
    --Verify what happened
    SELECT * FROM dbo.MusicGroups m
    INNER JOIN dbo.Artists a ON m.MusicGroupId = a.csMusicGroupMusicGroupId
    WHERE m.MusicGroupId = @MusicGroupId; 

    SELECT * FROM dbo.ErrorLog;

    --Cleanup
    --DELETE FROM dbo.Artists WHERE LastName = 'Doe';
    --DELETE FROM dbo.MusicGroups WHERE Name = 'The Doe family';
    --DELETE FROM dbo.ErrorLog;

