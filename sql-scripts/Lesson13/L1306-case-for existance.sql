USE sakila;
GO

--use simple CASE expression to check for existance in aggregated result 
SELECT f.title,
    CASE (SELECT count(*) FROM inventory i WHERE i.film_id = f.film_id)
        WHEN 0 THEN 'Out Of Stock'
        WHEN 1 THEN 'Scarce'
        WHEN 2 THEN 'Scarce'
        WHEN 3 THEN 'Available'
        WHEN 4 THEN 'Available'
        ELSE 'Common'
    END film_availability
FROM film f
