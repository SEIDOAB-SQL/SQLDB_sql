USE [sql-goodfriends]
GO

;WITH cityleastpets AS
(
    SELECT TOP 1 City, COUNT(*) petcount FROM dbo.Pets p
    INNER JOIN dbo.Friends f ON p.OwnerFriendId = f.FriendId
    INNER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
    GROUP BY City
    ORDER BY 2 ASC
),

leastpopularincity AS
(
    SELECT TOP 2 AnimalKindString, COUNT(*) petcount FROM dbo.Pets p
    INNER JOIN dbo.Friends f ON p.OwnerFriendId = f.FriendId
    INNER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
    WHERE City IN (SELECT City FROM cityleastpets)
    GROUP BY AnimalKindString
    ORDER BY 2 ASC
),

friendswithleastpopularpet AS
(SELECT FriendId, FirstName, LastName, AnimalKindString FROM dbo.Friends f
 INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
 WHERE AnimalKindString IN (SELECT AnimalKindString FROM leastpopularincity)
 )

SELECT * FROM friendswithleastpopularpet 