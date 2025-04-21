USE sakila;
GO

--With CUBE: How many rentals each year broken down into months AND total per months
SELECT YEAR(rental_date) AS YEAR, MONTH(rental_date) AS MONTH, COUNT(*) AS NrRentals
FROM dbo.rental
GROUP BY YEAR(rental_date), MONTH(rental_date) WITH CUBE
ORDER BY 1, 2 ASC;

--Another CUBE: How many movies has an actor made broken down into ratings AND total per rating
SELECT fa.actor_id, f.rating, COUNT(*)
FROM film_actor fa
    INNER JOIN film f ON fa.film_id = f.film_id
GROUP BY fa.actor_id, f.rating WITH CUBE
ORDER BY 1,2; 

