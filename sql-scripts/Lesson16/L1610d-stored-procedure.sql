USE musicefc;
GO


CREATE OR ALTER PROCEDURE dbo.usp_InsertMusicGroupAndArtists 

    @FamilyName NVARCHAR(10) 

AS

    --Lets execute usp_InsertMusicGroup and usp_InsertArtist wit and without errors
    DECLARE @retCode INT;
    DECLARE @MusicGroupId UNIQUEIDENTIFIER;
    DECLARE @ArtisId UNIQUEIDENTIFIER;

    DECLARE @GroupName NVARCHAR(200) = CONCAT_WS(N' ', 'The', @FamilyName, 'family');

    BEGIN TRANSACTION    
    BEGIN TRY

        EXEC dbo.usp_InsertMusicGroup NULL, @GroupName, 2023,  @MusicGroupId OUTPUT;
        EXEC dbo.usp_InsertArtist NULL, 'John', @FamilyName,  @ArtisId OUTPUT, NULL, @MusicGroupId;
        EXEC dbo.usp_InsertArtist NULL, 'Mary', @FamilyName,  @ArtisId OUTPUT, NULL, @MusicGroupId;
        EXEC dbo.usp_InsertArtist NULL, 'Kim', @FamilyName,  @ArtisId OUTPUT, NULL, @MusicGroupId;
        SET @retCode = 0;
        COMMIT;
    END TRY
    
    BEGIN CATCH

        SELECT * FROM dbo.ErrorLog;
        SET @retCode = 1;
        ROLLBACK;

    END CATCH;    
    RETURN @retCode;
GO


--Execute the SP
DECLARE @FName NVARCHAR(10) = 'Doe';

EXEC dbo.usp_InsertMusicGroupAndArtists @FName;

--Verify what happened
SELECT * FROM dbo.MusicGroups m
INNER JOIN dbo.csArtistcsMusicGroup amg ON amg.MusicGroupsMusicGroupId = m.MusicGroupId
INNER JOIN dbo.Artists a ON a.ArtistId = amg.MembersArtistId
WHERE a.LastName = @FName;

SELECT * FROM dbo.ErrorLog;

    --Cleanup
    --DELETE FROM dbo.Artists WHERE LastName = 'Doe';
    --DELETE FROM dbo.MusicGroups WHERE Name = 'The Does family';
    --DELETE FROM dbo.ErrorLog;

