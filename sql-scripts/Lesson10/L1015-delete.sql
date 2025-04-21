USE sakila;
GO

--use transaction to roll back delete
BEGIN TRANSACTION;

--SELECT / DELETE all customers who has not returned a rental
SELECT COUNT(*) 
--DELETE c
FROM dbo.customer AS c
WHERE EXISTS (
    SELECT 1
    FROM dbo.rental r
    WHERE c.customer_id = r.customer_id AND r.return_date IS NULL);

--rolling back the delete
ROLLBACK TRANSACTION;


--use for verification
SELECT COUNT(DISTINCT customer_id)
FROM rental r
WHERE r.return_date IS NULL;

