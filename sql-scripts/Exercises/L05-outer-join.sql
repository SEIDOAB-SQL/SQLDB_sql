USE [sql-goodfriends]
GO;


SELECT FirstName, LastName, p.Name, p.AnimalKindString FROM dbo.Friends f
FULL OUTER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId;


SELECT FirstName, LastName, p.Name, p.AnimalKindString FROM dbo.Friends f
FULL OUTER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId;


SELECT COUNT(*) FROM dbo.Pets WHERE OwnerFriendId IS NULL

SELECT COUNT(*) FROM dbo.Pets WHERE AnimalKindString = 'Bird'

UPDATE dbo.Pets 
SET OwnerFriendId = NULL
WHERE AnimalKindString = 'Bird'


SELECT FirstName, LastName, a.City, p.Name, p.AnimalKindString FROM dbo.Friends f
FULL OUTER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId;
