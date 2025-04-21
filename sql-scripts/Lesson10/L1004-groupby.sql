USE sakila;
GO

SELECT r.customer_id, 
    CONCAT_WS(' ', c.first_name, c.last_name) AS CusName, COUNT(*) AS NrRentals, 
    SUM (p.amount) AS RentalAmount
FROM dbo.rental r 
    INNER JOIN dbo.payment p ON r.rental_id = p.rental_id
    INNER JOIN dbo.customer c ON r.customer_id = c.customer_id
GROUP BY r.customer_id, CONCAT_WS(' ', c.first_name, c.last_name)
ORDER BY 3 DESC;

