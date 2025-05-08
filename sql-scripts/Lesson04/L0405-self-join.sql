USE friends;
GO

--Add a Best Friend column to the Friends table
ALTER TABLE dbo.Friend 
ADD BestFriendId int NULL;
GO

--set a couple of Best Friends
UPDATE dbo.Friend
SET BestFriendId = 5
WHERE FriendID = 8;

UPDATE dbo.Friend
SET BestFriendId = 8
WHERE FriendID = 3;

--use a self join to get Best friend details
SELECT CONCAT_WS(' ', f.FirstName, f.LastName, 'is best friend with', bf.FirstName, bf.LastName)
FROM dbo.friend f 
INNER JOIN dbo.friend bf
ON f.BestFriendId = bf.FriendId;

--remove the BestFriend column
ALTER TABLE dbo.Friends 
DROP COLUMN BestFriendId;
