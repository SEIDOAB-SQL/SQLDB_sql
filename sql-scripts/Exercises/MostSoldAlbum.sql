-- Exercise Advanced Query, Correlated Queries
-- Using the musicefc database, create a View that shows every column from MusicGroup together 
-- with most sold AlbumId and most sold number of copies of that album.

-- Most sold album Alt 1 Subquery, using TOP 1 to find high runner
CREATE OR ALTER VIEW dbo.vw_MusicGroups
AS
SELECT  m.*, 
        
        (SELECT TOP 1 AlbumId FROM dbo.Albums hr 
         WHERE m.MusicGroupId = hr.csMusicGroupMusicGroupId 
         ORDER BY CopiesSold DESC) [High runner AlbumId],
        
        (SELECT TOP 1 CopiesSold FROM dbo.Albums hr 
         WHERE m.MusicGroupId = hr.csMusicGroupMusicGroupId 
         ORDER BY CopiesSold DESC) [High runner copies]
FROM MusicGroups m

GO

--Test the view
SELECT * FROM dbo.vw_MusicGroups;