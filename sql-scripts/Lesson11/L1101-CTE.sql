USE sakila;
GO

--beginning CTE part
;WITH rentals AS 
    (SELECT rental_id, return_date FROM dbo.rental
     WHERE return_date IS NOT NULL) -- CTE makes it easier for me break up filtering

-- end of With clause

-- start of the SELECT using the CTE defined 
SELECT c.last_name, c.first_name, r.return_date, p.amount
FROM dbo.customer AS c
INNER JOIN dbo.payment p ON c.customer_id = p.customer_id
INNER JOIN rentals r ON p.rental_id = r.rental_id
ORDER BY 1,2,3 DESC;
