USE [sql-goodfriends]
GO
SELECT YEAR(Birthday), MONTH(Birthday), COUNT(*) FROM dbo.Friends
GROUP BY YEAR(Birthday), MONTH(Birthday) WITH ROLLUP
ORDER BY 1 DESC, 2 DESC

SELECT COUNT(*) FROM dbo.Friends
WHERE Birthday IS NULL 

USE [sql-music]
GO


SELECT TOP 10 mg.[Name], SUM(CopiesSold) FROM dbo.MusicGroups mg
INNER JOIN dbo.Albums al ON mg.MusicGroupId = al.MusicGroupsMusicGroupId
GROUP BY mg.[Name]
ORDER BY 2 DESC


SELECT tmg.* 
INTO #mGroups
FROM
    (SELECT TOP 5 mg.[MusicGroupId] as mgId, SUM(CopiesSold) as alSold FROM dbo.MusicGroups mg
    INNER JOIN dbo.Albums al ON mg.MusicGroupId = al.MusicGroupsMusicGroupId
    GROUP BY mg.[MusicGroupId]
    ORDER BY 2 DESC) tmg

SELECT * FROM #mGroups mg
INNER JOIN dbo.ArtistMusicGroup artmg ON mg.mgId = artmg.MusicGroupsMusicGroupId
INNER JOIN dbo.Artists art ON artmg.MembersArtistId = art.ArtistId

DROP TABLE #mGroups
