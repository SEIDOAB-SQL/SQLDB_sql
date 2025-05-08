SELECT Country, City, AnimalKindString, COUNT (*) FROM dbo.Pets p
INNER JOIN dbo.Friends f ON p.OwnerFriendId = f.FriendId
INNER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
GROUP BY Country, City, AnimalKindString WITH ROLLUP
ORDER BY 1, 2, 3