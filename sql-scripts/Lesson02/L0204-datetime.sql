USE sakila;
GO

SELECT GETDATE(), SYSDATETIME(), SYSDATETIMEOFFSET();

SELECT [rental_id], [rental_date], 
    DATEADD(year,1,rental_date) AS OneMoreYear,
    DATEADD(month,1,rental_date) AS OneMoreMonth,
    DATEADD(day,-1,rental_date) AS OneLessDay

FROM [sakila].[dbo].[rental]
WHERE rental_date BETWEEN '2005-05-24 00:00:00' AND '2005-05-25 00:00:00';


SELECT [rental_id], [rental_date], GETDATE(), 
    DATEDIFF(year, rental_date, GETDATE()) AS yeardiff,
    DATEDIFF(month, rental_date, GETDATE()) AS monthdiff,
    DATEDIFF(day, rental_date, GETDATE()) AS daydiff

FROM [sakila].[dbo].[rental]
WHERE rental_date BETWEEN '2005-05-24 00:00:00' AND '2005-05-25 00:00:00';

