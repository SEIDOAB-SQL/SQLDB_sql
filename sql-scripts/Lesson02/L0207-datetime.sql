USE sakila;
GO

--using convert
SELECT [rental_id], [rental_date], 
    CONVERT(varchar,rental_date, 1) AS [1],
    CONVERT(varchar,rental_date, 101) AS [101],
    CONVERT(varchar,rental_date, 2) AS [2],
    CONVERT(varchar,rental_date, 102) AS [102],
    CONVERT(varchar,rental_date, 20) AS [20]

FROM [sakila].[dbo].[rental]
WHERE rental_date BETWEEN '2005-05-24 00:00:00' AND '2005-05-25 00:00:00';

--using format
DECLARE @d DATETIME = GETDATE(); 
SELECT FORMAT( @d, 'dd', 'en-US' ) AS Result;
SELECT FORMAT( @d, 'yyyy-M-d') AS Result;
SELECT FORMAT( @d, 'MM/dd/yyyy', 'en-US' ) AS Result;

