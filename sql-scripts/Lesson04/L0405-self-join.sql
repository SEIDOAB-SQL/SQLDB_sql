USE friends;
GO

--Add a Best Friend column to the Friends table
ALTER TABLE dbo.Friends 
ADD BestFriendId int NULL;
GO

--set a couple of Best Friends
UPDATE dbo.Friends
SET BestFriendId = 15
WHERE FriendID = 10;

UPDATE dbo.Friends
SET BestFriendId = 13
WHERE FriendID = 9;

--use a self join to get Best friend details
SELECT CONCAT_WS(' ', f.FirstName, f.LastName, 'is best friend with', bf.FirstName, bf.LastName)
FROM dbo.friends f 
INNER JOIN dbo.friends bf
ON f.BestFriendId = bf.FriendId;

--remove the BestFriend column
ALTER TABLE dbo.Friends 
DROP COLUMN BestFriendId;
