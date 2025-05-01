USE goodfriendsefc;
GO

--list unique firstnames
SELECT DISTINCT FirstName FROM dbo.Friends;
--list unique lastnames
SELECT DISTINCT LastName FROM dbo.Friends;
--list unique names (firstname and lastname)
SELECT DISTINCT FirstName, LastName FROM dbo.Friends;


--Number of unique names (firstname and lastname)
SELECT COUNT(DISTINCT CONCAT_WS(' ', FirstName, LastName)) FROM dbo.Friends;

--Challange: Number of possible unique names (firstname and lastname)
SELECT DISTINCT FirstName [Name] INTO #tmpFN FROM dbo.Friends;
SELECT DISTINCT LastName [Name] INTO #tmpLN FROM dbo.Friends;
SELECT COUNT(*) FROM #tmpFN f
CROSS JOIN #tmpLN l;

DROP TABLE IF EXISTS #tmpFN;
DROP TABLE IF EXISTS #tmpLN;