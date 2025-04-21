USE sakila;
GO

-- inactive customers that has not retured a rental
SELECT r.rental_id, r.customer_id, c.first_name, c.active
FROM dbo.rental r
INNER JOIN dbo.customer c ON r.customer_id = c.customer_id
WHERE r.return_date IS NULL AND c.active = 0;


--use searched CASE expression to make a conditional update
BEGIN TRAN

UPDATE dbo.customer 
    SET active = 
        CASE
            WHEN EXISTS (SELECT 1 FROM rental r
                 WHERE r.customer_id = dbo.customer.customer_id AND r.return_date IS NULL)
                
            THEN 3
            ELSE active 
        END
WHERE active = 0;

--simle confirmation
SELECT r.rental_id, r.customer_id, c.first_name, c.active
FROM dbo.rental r
INNER JOIN dbo.customer c ON r.customer_id = c.customer_id
WHERE r.return_date IS NULL AND c.active = 3;

--until confirmation is ok I ROLLBACK
ROLLBACK TRAN