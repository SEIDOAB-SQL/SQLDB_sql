USE friends;
GO


--Explore differnce between left and right outer join.
--First lets insert some pets without friend
INSERT INTO dbo.Pet (AnimalKind, Name)
VALUES ('Fish', 'Tom'),
       ('Bird', 'Max');


SELECT * 
FROM dbo.friend f 
INNER JOIN dbo.Pet p ON f.FriendId = p.FriendId;

--Use Outer right join to get ALL Pets (right table) even if Pet.FriendId IS NULL
SELECT * 
FROM dbo.friend f 
RIGHT OUTER JOIN dbo.Pet p ON f.FriendId = p.FriendId;

--Use Outer left join to get ALL Friends (left table), even if they do not exists in Pet table
SELECT * 
FROM dbo.friend f 
LEFT OUTER JOIN dbo.Pet p ON f.FriendId = p.FriendId;