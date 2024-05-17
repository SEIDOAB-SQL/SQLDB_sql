-- Exercise Advanced Query, Correlated Queries
-- Using the musicefc database, create a View that shows every column from MusicGroup together 
-- with a column show in how many days the MusicGroups has a birthday to celebrate

-- Subquery, using TOP 1 to find high runner
CREATE OR ALTER VIEW dbo.vw_MusicGroups3
AS
SELECT  m.*, 
                
        (SELECT TOP 1 dbo.udf_DaysToBirthday(ar.BirthDay) FROM dbo.Artists ar 
         WHERE m.MusicGroupId = ar.csMusicGroupMusicGroupId AND
               dbo.udf_DaysToBirthday(ar.BirthDay) > 0
         ORDER BY dbo.udf_DaysToBirthday(ar.BirthDay) ASC) [Nr of days to Birthday]

FROM MusicGroups m

GO

--Test the view
SELECT * FROM dbo.vw_MusicGroups3
WHERE [Nr of days to Birthday] IS NOT NULL
ORDER BY [Nr of days to Birthday] ASC
