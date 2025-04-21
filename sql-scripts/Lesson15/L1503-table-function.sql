USE goodfriendsefc;
GO

CREATE FUNCTION dbo.udf_MostPets()
RETURNS TABLE AS
RETURN 

    SELECT TOP 1 a.Country, COUNT(p.PetId) [Nr of Pets] FROM dbo.Friends f
    INNER JOIN dbo.Pets p ON f.FriendId = p.csFriendFriendId
    INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
    GROUP BY a.Country
    ORDER BY 2 DESC
GO

CREATE FUNCTION dbo.udf_LeastFriends()
RETURNS TABLE AS
RETURN 
    SELECT TOP 1 a.Country, COUNT(f.FriendId) [Nr of Friends] FROM dbo.Friends f
    INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
    GROUP BY a.Country
    ORDER BY 2 ASC 
GO

--test it
SELECT * FROM dbo.udf_MostPets();
SELECT * FROM dbo.udf_LeastFriends();

--Now it is easy to use as a subquery, For example
--List all cities in the countries where I have least friends or most pets 
SELECT DISTINCT Country, City FROM dbo.Adress
WHERE Country IN (
    SELECT Country from dbo.udf_MostPets()
    UNION
    SELECT Country from dbo.udf_LeastFriends());


--House cleaning only for the example
DROP FUNCTION IF EXISTS dbo.udf_MostPets;
DROP FUNCTION IF EXISTS dbo.udf_LeastFriends;
GO