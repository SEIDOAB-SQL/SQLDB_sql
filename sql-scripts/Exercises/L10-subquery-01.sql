USE sakila;
GO

SELECT c.last_name, c.first_name, f.title, f.film_id FROM dbo.customer c
INNER JOIN dbo.rental r ON c.customer_id = r.customer_id
INNER JOIN dbo.inventory i ON r.inventory_id = i.inventory_id
INNER JOIN dbo.film f ON f.film_id = i.film_id
WHERE f.film_id IN (34, 75);

SELECT TOP 1 film_id, MAX(replacement_cost) FROM dbo.film
GROUP BY film_id
ORDER BY 2 DESC;

SELECT fid.film_id FROM (
    SELECT TOP 1 film_id, MAX(replacement_cost) [max cost] FROM dbo.film
    GROUP BY film_id
    ORDER BY 2 DESC) fid;


SELECT c.last_name, c.first_name, f.title, f.film_id FROM dbo.customer c
INNER JOIN dbo.rental r ON c.customer_id = r.customer_id
INNER JOIN dbo.inventory i ON r.inventory_id = i.inventory_id
INNER JOIN dbo.film f ON f.film_id = i.film_id
WHERE f.film_id IN (
    SELECT fid.film_id FROM (SELECT TOP 1 film_id, MAX(replacement_cost) [max cost] FROM dbo.film
    GROUP BY film_id
    ORDER BY 2 DESC) fid);