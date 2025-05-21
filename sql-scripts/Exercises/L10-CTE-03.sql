-- find the music groups with the 5 oldest artists
-- CTE

;WITH artists AS 
(
    SELECT TOP 5 ArtistId, Birthday, DATEDIFF (day,Birthday, GETDATE()) as ageindays
    FROM dbo.Artists
    ORDER BY 3 DESC
),
musicgroups as 
(
    SELECT * FROM dbo.MusicGroups mg
    INNER JOIN dbo.ArtistMusicGroup amg ON mg.MusicGroupId = amg.MusicGroupsMusicGroupId 
    INNER JOIN artists a ON amg.MembersArtistId = a.ArtistId

)
SELECT Name FROM musicgroups;