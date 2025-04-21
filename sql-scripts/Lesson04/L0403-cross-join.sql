USE sakila;
GO
--How many name combinations can I make from customers distinct firstname 
--and actors distinct last names
--Use UNION with where and Order by
SELECT 'Customers firstnames starting with A', 
    COUNT(DISTINCT first_name) AS nr_distinct_names
    FROM dbo.customer
WHERE first_name LIKE 'A%'
UNION ALL
SELECT 'Actors lastnames starting with A', 
    COUNT(DISTINCT last_name) AS nr_distinct_names
    FROM dbo.actor
WHERE last_name LIKE 'A%'
ORDER BY nr_distinct_names DESC;


--create a couple of temp tables and fill with distinct names
SELECT DISTINCT first_name 
INTO #cfNames 
FROM dbo.customer;

SELECT DISTINCT last_name 
INTO #alNames 
FROM dbo.actor;

--Use cross join to make all possible combinations of fnames and lnames
SELECT c.first_name, a.last_name 
FROM #cfNames AS c CROSS JOIN #alNames AS a
WHERE c.first_name LIKE 'A%' AND a.last_name LIKE 'A%';

DROP TABLE #cfNames;
DROP TABLE #alNames;