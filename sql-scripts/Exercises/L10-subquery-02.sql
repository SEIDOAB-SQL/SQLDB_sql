USE goodfriendsefc;
GO

--Helper function that creates days to birthday from today, this year
CREATE OR ALTER FUNCTION dbo.udf_DaysToBirthday (@Birthday DATETIME )
RETURNS INT AS
BEGIN

RETURN DATEDIFF(DAY, GETDATE(), DATEADD(YEAR,DATEDIFF(YEAR, @Birthday, GETDATE()), @Birthday));
END
GO

--Solve the exercise here 

--STEP A: Break it dowon into separate SQL
SELECT TOP 1 FriendId, a.city, Birthday, dbo.udf_DaysToBirthday(Birthday) [days to birthday] FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
WHERE dbo.udf_DaysToBirthday(Birthday) >= 0
ORDER BY 4 ASC;

SELECT DISTINCT FriendId, FirstName, LastName, a.city FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
WHERE a.city = 'Esbjerg'

--STEP B: as Subquery
-- Isolate the scalar 
SELECT party.city FROM (
    SELECT TOP 1 FriendId, a.city, Birthday, dbo.udf_DaysToBirthday(Birthday) [days to birthday] FROM dbo.Friends f
    INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
    WHERE dbo.udf_DaysToBirthday(Birthday) >= 0
    ORDER BY 4 ASC ) party;

--Make final subquery
SELECT DISTINCT FriendId, FirstName, LastName, a.city FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
WHERE a.city = (
    SELECT party.city FROM (
        SELECT TOP 1 FriendId, a.city, Birthday, dbo.udf_DaysToBirthday(Birthday) [days to birthday] FROM dbo.Friends f
        INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
        WHERE dbo.udf_DaysToBirthday(Birthday) >= 0
        ORDER BY 4 ASC ) party);

--STEP C: as CTE
WITH party AS 
    (SELECT TOP 1 FriendId, a.city, Birthday, dbo.udf_DaysToBirthday(Birthday) [days to birthday] FROM dbo.Friends f
     INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
     WHERE dbo.udf_DaysToBirthday(Birthday) >= 0
     ORDER BY 4 ASC )

SELECT DISTINCT FriendId, FirstName, LastName, a.city FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
WHERE a.city = (SELECT city FROM party);