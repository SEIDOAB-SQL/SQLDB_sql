--Q4.10
;WITH oldest_fart AS (
    SELECT TOP 1 ArtistId, FirstName, LastName, 
           DATEDIFF (YEAR, BirthDay, GETDATE()) [age], DATEDIFF (DAY, BirthDay, GETDATE()) [agedays]
    FROM dbo.Artists WHERE BirthDay IS NOT NULL
    ORDER BY 5 DESC
)

--Find all the groups which has a member of the same age as the oldest_fart
SELECT * FROM dbo.MusicGroups g
INNER JOIN dbo.csArtistcsMusicGroup amg ON amg.MusicGroupsMusicGroupId = g.MusicGroupId
INNER JOIN dbo.Artists a ON a.ArtistId = amg.MembersArtistId
WHERE DATEDIFF (YEAR, a.BirthDay, GETDATE()) = (SELECT age FROM oldest_fart);