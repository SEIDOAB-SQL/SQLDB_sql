USE sakila;
GO

--declare a variable
DECLARE @rentalDays int = 8;
DECLARE @fromDate DATE = '2005-08-01';
DECLARE @toDate DATE = '2006-03-01';

--count the nr of rows without considering NULL
--Notice the AND (DATEDIFF..) structure 
SELECT COUNT(*) FROM dbo.rental
WHERE rental_date BETWEEN @fromDate AND @toDate
 AND (DATEDIFF(day, rental_date, return_date) >= @rentalDays)

--count the nr of rows including NULL
SELECT COUNT(*) FROM dbo.rental
WHERE rental_date BETWEEN @fromDate AND @toDate 
    AND (DATEDIFF(day, rental_date, return_date) >= @rentalDays OR return_date IS NULL);


--show the result set
SELECT rental_id, rental_date, return_date, DATEDIFF (day, rental_date, return_date) AS rental_days  
FROM dbo.rental
WHERE rental_date BETWEEN @fromDate AND @toDate 
    AND (DATEDIFF(day, rental_date, return_date) >= @rentalDays OR return_date IS NULL)
ORDER BY 4 DESC;



