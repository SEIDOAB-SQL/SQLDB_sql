USE sakila;
GO

-- notice the case insensitive.
-- This is due to collation, remember from L2, View collation of the SQL Server
SELECT CONVERT (varchar(256), SERVERPROPERTY('collation'));  
EXECUTE sp_helpsort;  

--IN Operator
-- Get all customers with specific last names, 
SELECT * FROM dbo.customer
WHERE last_name IN ('smith', 'anderson', 'gannon', 'farnsworth');



-- Get all rentals returned 8 or 10 days later
SELECT DATEDIFF (day, rental_date, return_date) AS rental_days, 
    COUNT(DATEDIFF (day, rental_date, return_date)) as number_rentals
FROM dbo.rental
WHERE DATEDIFF(day, rental_date, return_date) IN (8,10)
GROUP BY DATEDIFF (day, rental_date, return_date)
ORDER BY 1 DESC;
