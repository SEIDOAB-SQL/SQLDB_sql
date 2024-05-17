USE goodfriendsefc;
GO

--Nr of Pets per friend
SELECT f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName) [Name], COUNT(p.PetId) FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
GROUP BY f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName);

--Nr of Pets where Friends have more than 1 pet
SELECT f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName) [Name], COUNT(p.PetId) FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
GROUP BY f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName)
HAVING COUNT(p.PetId) > 1;