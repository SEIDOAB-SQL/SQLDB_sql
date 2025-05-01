USE sakila;
GO

SELECT [rental_id], [rental_date], 
    DATENAME(month,rental_date) AS month,
    DATENAME(weekday,rental_date) AS weekday,
    DATEPART(week,rental_date) AS week
FROM [sakila].[dbo].[rental]


SELECT [rental_id], [rental_date], [return_date],  DATEDIFF(day, rental_date, return_date) AS days_rented
FROM [sakila].[dbo].[rental]

USE [sql-goodfriends];
GO

SELECT CONCAT_WS(' ', FirstName, LastName) AS Name, DATENAME(month, Birthday) FROM dbo.Friends

SELECT DATENAME(month, Birthday), COUNT(*) FROM dbo.Friends
GROUP BY DATENAME(month, Birthday)


SELECT CONCAT_WS(' ', FirstName, LastName) AS Name, Birthday FROM dbo.Friends
WHERE (MONTH (Birthday) BETWEEN MONTH(GETDATE()) AND 13) 
AND NOT (MONTH (Birthday) = MONTH(GETDATE()) AND DAY (Birthday) < DAY(GETDATE()))
      