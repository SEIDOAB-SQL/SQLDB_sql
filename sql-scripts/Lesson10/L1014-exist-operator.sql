USE sakila;
GO

-- Customers that has a rental before '2005-05-25'
SELECT c.first_name, c.last_name 
FROM customer c
WHERE EXISTS (
    SELECT 1 FROM rental r 
    WHERE r.customer_id = c.customer_id AND r.rental_date < '2005-05-25');

-- Customers that do NOT have a rental before '2005-05-25'
SELECT c.first_name, c.last_name 
FROM customer c
WHERE NOT EXISTS (
    SELECT 1 FROM rental r 
    WHERE r.customer_id = c.customer_id AND r.rental_date < '2005-05-25');

    