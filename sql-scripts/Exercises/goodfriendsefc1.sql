USE goodfriendsefc;
GO

--How many Friends exist in total. 
SELECT COUNT(*) [Nr of friends]FROM dbo.Friends;
--How many Friends exist without adress 
SELECT COUNT(*) [Nr of friends without adress] FROM dbo.Friends WHERE AdressId IS NULL;
--How many Friends exist with Pet
SELECT COUNT(DISTINCT FriendId) [Nr of friends who owns a Pet] FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId;
--How many Friends exist without a Pet
SELECT COUNT(DISTINCT FriendId) [Nr of friends who does not owns a Pet] FROM dbo.Friends f
LEFT JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
WHERE p.PetId IS NULL;

--Using Union to get all data in one table
SELECT 'Nr of friends' [Titel], COUNT(*) [Count] FROM dbo.Friends
UNION
--How many Friends exist without adress 
SELECT 'Nr of friends without adress', COUNT(*)  FROM dbo.Friends WHERE AdressId IS NULL
UNION
--How many Friends exist with Pet
SELECT 'Nr of friends who owns a Pet', COUNT(DISTINCT FriendId) FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
UNION
--How many Friends exist without a Pet
SELECT 'Nr of friends who does not owns a Pet', COUNT(DISTINCT FriendId)  FROM dbo.Friends f
LEFT JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
WHERE p.PetId IS NULL;
