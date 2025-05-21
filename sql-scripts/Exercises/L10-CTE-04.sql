USE [sql-goodfriends];
GO

--Helper function that creates days to birthday from today, this year
CREATE OR ALTER FUNCTION dbo.udf_DaysToBirthday (@Birthday DATETIME )
RETURNS INT AS
BEGIN

RETURN DATEDIFF(DAY, GETDATE(), DATEADD(YEAR,DATEDIFF(YEAR, @Birthday, GETDATE()), @Birthday));
END
GO

SELECT TOP 1 FirstName, LastName, Birthday, dbo.udf_DaysToBirthday(Birthday) [days to birthday] FROM Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
WHERE Birthday IS NOT NULL AND  dbo.udf_DaysToBirthday(Birthday) >= 0
ORDER BY 4 ASC





--Exercise:
--Challange: Find all pet owners in the city where a pet owner has the next upcomming birthday this year
--Write one SQL query by using subqueries.

--Solution break down the SQL queries into subproblems:
--  a. find the next birthday person (this year) that has pets.
--  b. lists all the persons with pets that lives in the same city as the birthday person
