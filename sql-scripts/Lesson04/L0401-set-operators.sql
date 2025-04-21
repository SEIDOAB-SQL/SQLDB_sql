USE sakila;
GO

--Use UNION with where and Order by
SELECT 'Customers', 
    COUNT(DISTINCT first_name) AS nr_distinct_fnames
    FROM dbo.customer
WHERE first_name LIKE 'A%'
UNION ALL
SELECT 'Actors', 
    COUNT(DISTINCT first_name) AS nr_distinct_fnames
    FROM dbo.actor
WHERE first_name LIKE 'A%'
ORDER BY nr_distinct_fnames DESC;

