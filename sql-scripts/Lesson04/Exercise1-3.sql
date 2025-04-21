--Excercise 1
--Find all customers (first name, last name) that has not rented a movie

SELECT c.customer_id, first_name, last_name FROM
(
    SELECT customer_id FROM customer
    EXCEPT
    SELECT customer_id FROM rental
) as r
INNER JOIN customer c ON c.customer_id = r.customer_id
GO

--Exercise 2
--find all film titles that has not been rented out

CREATE OR ALTER VIEW  vwInvFilm AS
SELECT i.inventory_id, f.title FROM inventory i 
INNER JOIN film f ON i.film_id = f.film_id

GO

SELECT f.inventory_id, title FROM (
    SELECT inventory_id FROM vwInvFilm
    EXCEPT
    SELECT inventory_id FROM rental) non_rent
INNER JOIN vwInvFilm f ON non_rent.inventory_id = f.inventory_id


--Exercise 3
--which customers (first name, last name) has not returned a movie rental

SELECT c.customer_id FROM rental r 
INNER JOIN customer c ON c.customer_id = r.customer_id
WHERE return_date IS NULL

--alternative
SELECT * FROM (
    SELECT customer_id FROM rental r 
    WHERE return_date IS NULL
) non_returns
INNER JOIN customer c ON c.customer_id = non_returns.customer_id

