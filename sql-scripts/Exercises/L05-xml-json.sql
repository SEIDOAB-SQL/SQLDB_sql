USE [sql-goodfriends];
GO

-- List of all friends email
SELECT DISTINCT Email FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
WHERE p.AnimalKindString = 'Fish'
FOR XML AUTO

SELECT DISTINCT Email FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
WHERE p.AnimalKindString = 'Fish'
FOR JSON AUTO