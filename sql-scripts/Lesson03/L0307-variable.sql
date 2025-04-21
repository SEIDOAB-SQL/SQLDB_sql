USE sakila;
GO

--declare a variable
DECLARE @rentalDays int = 8;

--count the nr of rows
SELECT COUNT(*) FROM dbo.rental
WHERE DATEDIFF (day, rental_date, return_date) >= @rentalDays;

--show the result set
SELECT rental_id, rental_date, return_date, DATEDIFF (day, rental_date, return_date) AS rental_days  
FROM dbo.rental
WHERE DATEDIFF (day, rental_date, return_date) >= @rentalDays
ORDER BY 4 DESC;

--Let's consider NULL, i.e. those who has not returned a rental

--count the nr of rows including NULL
SELECT COUNT(*) FROM dbo.rental
WHERE DATEDIFF (day, rental_date, return_date) >= @rentalDays OR return_date IS NULL;
