USE musicefc;
GO

-- List all musicgroups, their artists and the artists birthday
SELECT m.MusicGroupId, a.ArtistId, Birthday FROM dbo.MusicGroups m 
INNER JOIN dbo.Artists a ON m.MusicGroupId = a.csMusicGroupMusicGroupId

-- Use CASE WHEN..ELSE to give result 'Party within 14 days' or 'Party within 30 days'
-- Birthdays comming in more than 30days should have 'No party' 
SELECT m.MusicGroupId, a.ArtistId, 
    CASE WHEN dbo.udf_DaysToBirthday(a.BirthDay) <= 14 THEN 'Party within 14 days'
         WHEN dbo.udf_DaysToBirthday(a.BirthDay) <= 30 THEN 'Party within 30 days'
         ELSE 'No party'
    END
    FROM dbo.MusicGroups m 
INNER JOIN dbo.Artists a ON m.MusicGroupId = a.csMusicGroupMusicGroupId

-- List only the music groups that has an artist with a Birthday upcomming within 30days
-- Show Number of DISTINCT MusicGroups, Grouped by 'Party within 14 days', 'Party within 30 days'
SELECT COUNT(DISTINCT m.MusicGroupId), 
    CASE WHEN dbo.udf_DaysToBirthday(a.BirthDay) <= 14 THEN 'Party within 14 days'
         WHEN dbo.udf_DaysToBirthday(a.BirthDay) <= 30 THEN 'Party within 30 days'
         ELSE 'No party'
    END
    FROM dbo.MusicGroups m 
INNER JOIN dbo.Artists a ON m.MusicGroupId = a.csMusicGroupMusicGroupId
WHERE dbo.udf_DaysToBirthday(a.BirthDay) <= 30
GROUP BY 
    CASE WHEN dbo.udf_DaysToBirthday(a.BirthDay) <= 14 THEN 'Party within 14 days'
         WHEN dbo.udf_DaysToBirthday(a.BirthDay) <= 30 THEN 'Party within 30 days'
         ELSE 'No party'
    END




-- List Number of Musicgroups per established year
SELECT YEAR (GETDATE()) - EstablishedYear [Group Age], COUNT(MusicGroupId) [Nr of Groups] FROM dbo.MusicGroups
GROUP BY YEAR (GETDATE()) - EstablishedYear

--Use CASE WHEN..ELSE in the SELECT to tell if a group is a 'Young group' (<50 years) or 'Old group' based on establed year
SELECT CASE WHEN YEAR (GETDATE()) - EstablishedYear < 50 THEN 'Young group'
            ELSE 'Old group' 
        END, COUNT(MusicGroupId) FROM dbo.MusicGroups
GROUP BY YEAR (GETDATE()) - EstablishedYear


--Use CASE WHEN..ELSE also on the GROUP BY to count number of 'Young group' (<50 years) or 'Old group'
SELECT CASE WHEN YEAR (GETDATE()) - EstablishedYear < 50 THEN 'Young group'
            ELSE 'Old group' 
        END, COUNT(MusicGroupId) FROM dbo.MusicGroups
GROUP BY 
    CASE WHEN YEAR (GETDATE()) - EstablishedYear < 50 THEN 'Young group'
         ELSE 'Old group' 
    END 



--CREATE A FUNCTION that takes a parameter @Year and using the  CASE WHEN..ELSE returns NVARCHAR(50) 'Young group' (<50 years) or 'Old group'
GO
CREATE OR ALTER FUNCTION dbo.udf_AgeCategory (@Year INT)
RETURNS NVARCHAR(50)
AS
BEGIN

RETURN 
    CASE WHEN YEAR (GETDATE()) - @Year < 50 THEN 'Young group'
         ELSE 'Old group' 
    END
END

GO

--Use the function to write a simple SELECT that counts the number of 'Young Groups' and 'Old groups'
SELECT dbo.udf_AgeCategory(EstablishedYear), COUNT(MusicGroupId) FROM dbo.MusicGroups
GROUP BY  dbo.udf_AgeCategory(EstablishedYear)