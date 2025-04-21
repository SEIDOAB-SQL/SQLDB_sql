--Exercise 4
--find all customers that has rented a movie with an actor having the same name as the customer.

--make a table rental_id, inventory_id, actor firstname
SELECT r.rental_id, r.inventory_id, a.first_name FROM rental r 
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id 

--INTERSECT

--make a table rental_id, inventory_id, customer firstname
SELECT r.rental_id, r.inventory_id, c.first_name FROM rental r 
INNER JOIN customer c ON c.customer_id = r.customer_id

--INTERSECT both tables

--VERIFICATION using temp table
--Put the table into a temp table
DROP TABLE IF EXISTS #tmpCusActName
SELECT * INTO #tmpCusActName
FROM
(
    --make a table rental_id, inventory_id, actor_id, actor firstname
    SELECT r.rental_id, r.inventory_id, a.first_name FROM rental r 
    INNER JOIN inventory i ON i.inventory_id = r.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN film_actor fa ON fa.film_id = f.film_id
    INNER JOIN actor a ON a.actor_id = fa.actor_id 

    INTERSECT

    --make a table rental_id, inventory_id, customer_id, customer firstname
    SELECT r.rental_id, r.inventory_id, c.first_name FROM rental r 
    INNER JOIN customer c ON c.customer_id = r.customer_id
) as cusact 

SELECT * FROM #tmpCusActName

--verification check 1
SELECT c.customer_id, c.first_name, c.last_name, t.first_name as actor_first_name FROM customer c 
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN #tmpCusActName t ON r.rental_id = t.rental_id


--verification check 2
SELECT c.customer_id, r.rental_id, c.first_name as customer_first_name, c.last_name as customer_last_name, t.first_name as common_name, a.first_name as actor_first_name, a.last_name as actor_last_name FROM customer c 
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN #tmpCusActName t ON r.rental_id = t.rental_id
-- join in all the way to the actor
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id

-- list only the actors which match the common name
WHERE a.first_name = t.first_name