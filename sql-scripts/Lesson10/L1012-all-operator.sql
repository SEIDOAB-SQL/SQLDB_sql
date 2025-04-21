USE sakila;
GO

--ALL Operator
--All customers which had a 0 payment amount
(SELECT DISTINCT customer_id FROM payment 
 WHERE amount = 0)
 
--All customers NOT included in the above
SELECT first_name, last_name
FROM customer
WHERE customer_id <> ALL (
    SELECT DISTINCT customer_id FROM payment 
    WHERE amount = 0)

