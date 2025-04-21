--Question is: List all the cities in one of the contries with most pets, in a single SQL

--Break down the challange

-- 1. Find one Country with most Pets
SELECT TOP 2 a.Country, COUNT(p.PetId) [Nr of Pets] FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
GROUP BY a.Country
ORDER BY 2 DESC;

-- 2. Isolate Country only, by using step1 as a subquery
SELECT mpc.Country FROM (SELECT TOP 2 a.Country, COUNT(p.PetId) [Nr of Pets] FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
GROUP BY a.Country
ORDER BY 2 DESC) mpc;

-- 3. Test the main query
SELECT DISTINCT Country, City FROM dbo.Adress
WHERE Country IN ('Sweden', 'Denmark');

-- 4. Now combine combine step 2 and 3 into one single SQL query

--Question is: List all the cities in top 2 contries with most pets, in a single SQL
SELECT DISTINCT Country, City FROM dbo.Adress
WHERE Country IN (
    SELECT mpc.Country FROM (
        SELECT TOP 2 a.Country, COUNT(p.PetId) [Nr of Pets] FROM dbo.Friends f
        INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
        INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
        GROUP BY a.Country
        ORDER BY 2 DESC) mpc
        );


-- Exercise: 
-- You are to give a birthday party to a pet owner, 
-- and want to invite all his/her pet owning friends who lives in the same city to a birthday party.
-- Write a SQL query by using subqueries that finds the next birthday person with Pet and 
-- lists all the friends in the same city  