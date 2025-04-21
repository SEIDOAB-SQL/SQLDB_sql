Use Friends;
GO

--Let look at our friends and pets
SELECT f.FriendId, f.FirstName, f.LastName, p.PetId, p.Name, p.FriendId 
FROM dbo.friend f 
INNER JOIN dbo.Address a
ON f.AddressId = a.AdressId
INNER JOIN dbo.Pet p
ON f.FriendId = p.FriendId
WHERE f.FriendId = 6;

--Let's remove a friend in the table Friend
DELETE dbo.Friend
WHERE FriendId = 6;

--The deletion has been cascaded, Friend and Pet is deleted
SELECT * FROM dbo.Friend WHERE FriendId = 6;
SELECT * FROM dbo.Pet WHERE FriendId = 6;

