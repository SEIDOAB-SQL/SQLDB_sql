USE sakila;
GO

--With ROLLUP: How many rentals each year broken down into months
SELECT YEAR(rental_date) AS YEAR, MONTH(rental_date) AS MONTH, COUNT(*) AS NrRentals
FROM dbo.rental
GROUP BY YEAR(rental_date), MONTH(rental_date) WITH ROLLUP
ORDER BY 1, 2 ASC;

--Another ROLLUP: How many movies has an actor made broken down into ratings
SELECT fa.actor_id, f.rating, COUNT(*)
FROM film_actor fa
    INNER JOIN film f ON fa.film_id = f.film_id
GROUP BY fa.actor_id, f.rating WITH ROLLUP
ORDER BY 1,2; 

--Use COALESCE if you want  something more meaningfull than NULL in the rollup
SELECT  COALESCE(CAST(YEAR(rental_date) AS NVARCHAR), 'All years') AS YEAR, 
        COALESCE(CAST(MONTH(rental_date) AS NVARCHAR), 'All months') AS MONTH, 
        COUNT(*) AS NrRentals
FROM dbo.rental
GROUP BY YEAR(rental_date), MONTH(rental_date) WITH ROLLUP
ORDER BY 1, 2 ASC;
