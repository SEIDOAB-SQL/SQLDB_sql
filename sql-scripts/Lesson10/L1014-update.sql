USE sakila;
GO

--UPDATE all customers last_update to the latest rental date for respective customer
UPDATE dbo.customer
SET last_update =
 (SELECT max(r.rental_date) FROM rental r
  WHERE r.customer_id = c.customer_id)
FROM dbo.customer c;

--UPDATE only customer with id 4, 5 or 6
UPDATE dbo.customer
SET last_update =
 (SELECT max(r.rental_date) FROM rental r
  WHERE r.customer_id = c.customer_id)
FROM dbo.customer c
WHERE customer_id IN (4,5,6);
