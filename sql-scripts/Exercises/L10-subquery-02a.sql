--Exercise subquires 2
USE goodfriendsefc;
GO

--Who has birthdays in May after 20th
SELECT FriendId, Birthday from Friends WHERE MONTH(Birthday) = 5 AND DAY(Birthday) >= 20;

--What cities do they live in
SELECT a.city FROM Friends f 
INNER JOIN Adress a ON a.AdressId = f.AdressId
WHERE f.FriendId IN (
    SELECT FriendId from Friends WHERE MONTH(Birthday) = 5 AND DAY(Birthday) >= 20
    );

--List all Friends in the city that has pets where there is a birthday after May 20
SELECT DISTINCT (f.FriendId), f.FirstName, f.LastName, a.city FROM Friends f 
INNER JOIN Adress a ON a.AdressId = f.AdressId
INNER JOIN Pets p ON p.OwnerFriendId = f.FriendId
WHERE a.city IN (
    SELECT a.city FROM Friends f 
        INNER JOIN Adress a ON a.AdressId = f.AdressId
        WHERE f.FriendId IN (
            SELECT FriendId from Friends WHERE MONTH(Birthday) = 5 AND DAY(Birthday) >= 20
    )
)