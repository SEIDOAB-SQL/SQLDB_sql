USE sakila;
GO

SELECT YEAR(rental_date) AS YEAR, COUNT(*) AS NrRentals
FROM dbo.rental
GROUP BY YEAR(rental_date)
ORDER BY 1 ASC;

--WITHOUT ROLLUP: How many rentals per month
SELECT YEAR(rental_date) AS YEAR, MONTH(rental_date) AS MONTH, COUNT(*) AS NrRentals
FROM dbo.rental
GROUP BY YEAR(rental_date), MONTH(rental_date)
ORDER BY 1, 2 ASC;
