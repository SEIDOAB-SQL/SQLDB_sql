USE sakila;
GO

--using DATEPART
SELECT [rental_id], [rental_date], 
    DATEPART(year,rental_date) AS year,
    DATEPART(month,rental_date) AS month,
    DATEPART(day,rental_date) AS day,
    DATEPART(weekday,rental_date) AS weekday,
        DATEPART(week,rental_date) AS week

FROM [sakila].[dbo].[rental]
WHERE rental_date BETWEEN '2005-05-24 00:00:00' AND '2005-05-25 00:00:00';

--using DATENAME
SELECT [rental_id], [rental_date], 
    DATENAME(year,rental_date) AS year,
    DATENAME(month,rental_date) AS month,
    DATENAME(day,rental_date) AS day,
    DATENAME(weekday,rental_date) AS weekday

FROM [sakila].[dbo].[rental]
WHERE rental_date BETWEEN '2005-05-24 00:00:00' AND '2005-05-25 00:00:00';

--using year, month, day
SELECT [rental_id], [rental_date], 
    YEAR(rental_date) AS year,
    MONTH(rental_date) AS month,
    DAY(rental_date) AS day

FROM [sakila].[dbo].[rental]
WHERE rental_date BETWEEN '2005-05-24 00:00:00' AND '2005-05-25 00:00:00';