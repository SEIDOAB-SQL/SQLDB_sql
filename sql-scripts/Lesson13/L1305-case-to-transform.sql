USE sakila;
GO

--regular aggregated SELECT
SELECT DATENAME(month, rental_date) as month, COUNT (DATENAME(month, rental_date)) as [nr rentals]
FROM dbo.rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01'
GROUP BY DATENAME(month, rental_date);

--use searched CASE expression to transfor the results from row to column
SELECT
    SUM(CASE WHEN DATENAME(month, rental_date) = 'May' THEN 1 ELSE 0 END) May_rentals, 
    SUM(CASE WHEN DATENAME(month, rental_date) = 'June' THEN 1 ELSE 0 END) June_rentals, 
    SUM(CASE WHEN DATENAME(month, rental_date) = 'July' THEN 1 ELSE 0 END) July_rentals

FROM dbo.rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01';
