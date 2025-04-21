-- MySql and SQlite run in DBeaver

-- Friend Count
SELECT COUNT(*) FROM Friends;

-- Harry Potter Count
SELECT COUNT(*) FROM Friends
WHERE FirstName = 'Harry' AND LastName = 'Potter';

-- Friends in Denmark
SELECT COUNT(*) FROM Friends f 
INNER JOIN Adress a ON a.AdressId = f.AdressId
WHERE a.Country = 'Denmark';

-- Friends without an adress
SELECT COUNT(*) FROM Friends
WHERE AdressId IS NULL;

-- Friends without a pet
SELECT Count(*) FROM Friends f 
LEFT OUTER JOIN Pets p ON p.OwnerFriendId = f.FriendId
WHERE p.PetId IS NULL;

-- friends grouped by country
SELECT a.Country, COUNT(*) FROM Friends f 
INNER JOIN Adress a ON a.AdressId = f.AdressId
GROUP BY a.Country