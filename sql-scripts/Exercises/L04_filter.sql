USE [sql-goodfriends]
GO

SELECT LastName, COUNT(*) FROM dbo.Friends
WHERE LastName IN ('Took', 'Baggins', 'Potter')
GROUP BY LastName

SELECT Name, COUNT(*) FROM dbo.Pets
WHERE Name LIKE '%A%'
GROUP BY Name

SELECT FirstName, LastName FROM dbo.Pets p
INNER JOIN dbo.Friends f ON p.OwnerFriendId = f.FriendId
WHERE Name = 'Wanda'


USE sakila
GO
--declare a variable
DECLARE @fromDate DATE = '2005-07-01';
DECLARE @toDate DATE = '2005-08-31';

--count the nr of rows without considering NULL
--Notice the AND (DATEDIFF..) structure 
SELECT MONTH(payment_date), COUNT(*) FROM dbo.payment
WHERE payment_date BETWEEN @fromDate AND @toDate
GROUP BY MONTH(payment_date)

SELECT MONTH(payment_date), SUM(amount) FROM dbo.payment
WHERE payment_date BETWEEN @fromDate AND @toDate
GROUP BY MONTH(payment_date)
