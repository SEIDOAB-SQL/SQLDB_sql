USE [sql-goodfriends];
GO

--Helper function that creates days to birthday from today, this year
CREATE OR ALTER FUNCTION dbo.udf_DaysToBirthday (@Birthday DATETIME )
RETURNS INT AS
BEGIN

RETURN DATEDIFF(DAY, GETDATE(), DATEADD(YEAR,DATEDIFF(YEAR, @Birthday, GETDATE()), @Birthday));
END
GO

SELECT FirstName, LastName, Birthday, dbo.udf_DaysToBirthday(Birthday) [days to birthday] FROM Friends;


--Exercise:
--Challange: Find all pet owners in the city where a pet owner has the next upcomming birthday this year
--Write one SQL query by using subqueries.

--Solution break down the SQL queries into subproblems:
--  a. find the next birthday person (this year) that has pets.
--  b. lists all the persons with pets that lives in the same city as the birthday person
--Solve the exercise here using CTE
;WITH birthdayhen as (
    SELECT DISTINCT TOP 1 FriendId, FirstName, LastName, a.city [city], Birthday, dbo.udf_DaysToBirthday(Birthday) [days to birthday] FROM Friends f
    INNER JOIN Addresses a ON a.AddressId = f.AddressId
    INNER JOIN Pets p ON p.OwnerFriendId = f.FriendId
    WHERE  dbo.udf_DaysToBirthday(Birthday) >= 0
    ORDER BY dbo.udf_DaysToBirthday(Birthday) ASC)

, citywithbirthday as (
    SELECT DISTINCT (FriendId), FirstName, LastName, city, Birthday, dbo.udf_DaysToBirthday(Birthday) [days to birthday] FROM Friends f
    INNER JOIN Addresses a ON a.AddressId = f.AddressId
    INNER JOIN Pets p ON p.OwnerFriendId = f.FriendId
    WHERE a.City IN (SELECT city FROM birthdayhen)
)
--All friends in the city with pets
--SELECT * FROM citywithbirthday;

--All friends in the city with pets excpet birthdayhen
SELECT * FROM citywithbirthday c 
WHERE c.FriendId NOT IN (SELECT FriendId FROM birthdayhen);
