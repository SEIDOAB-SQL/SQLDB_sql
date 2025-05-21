;WITH cityleastpets AS
(SELECT TOP 1 City, COUNT(*) petcount FROM dbo.Pets p
INNER JOIN dbo.Friends f ON p.OwnerFriendId = f.FriendId
INNER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
GROUP BY City
ORDER BY 2 ASC
)

SELECT * FROM cityleastpets 