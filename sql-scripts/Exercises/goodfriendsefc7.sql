
SELECT COUNT(FriendId)
FROM [dbo].[Friends]
WHERE DATEDIFF(year, Birthday,  GETDATE()) > 30;

SELECT DATEDIFF(year, Birthday,  GETDATE()) [age], COUNT(FriendId)
FROM [dbo].[Friends]
GROUP BY DATEDIFF(year, Birthday,  GETDATE())
ORDER BY 1 DESC;

SELECT TOP 1 p.Name, COUNT (f.FriendId)
FROM [dbo].[Friends] f
INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
WHERE DATEDIFF(year, f.Birthday,  GETDATE()) <= 30
GROUP BY p.Name
ORDER BY 2 DESC;