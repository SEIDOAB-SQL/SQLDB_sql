USE sakila;
GO

--declare a variable
DECLARE @fromRentalDays int = 3;
DECLARE @toRentalDays int = 4;
DECLARE @fromDate DATE = '2005-08-01';
DECLARE @toDate DATE = '2006-03-01';


--use BETWEEN with integers
SELECT COUNT(*) FROM dbo.rental
WHERE rental_date BETWEEN @fromDate AND @toDate 
    AND (DATEDIFF(day, rental_date, return_date) BETWEEN @fromRentalDays AND @toRentalDays);

--show the result set
--Notice we so far did not cover NULL in aggregates and grou by, comming later...
SELECT DATEDIFF (day, rental_date, return_date) AS rental_days, 
    COUNT(DATEDIFF (day, rental_date, return_date)) as number_rentals
FROM dbo.rental
WHERE rental_date BETWEEN @fromDate AND @toDate 
    AND (DATEDIFF(day, rental_date, return_date) BETWEEN @fromRentalDays AND @toRentalDays)
GROUP BY DATEDIFF (day, rental_date, return_date)
ORDER BY 1 DESC;

