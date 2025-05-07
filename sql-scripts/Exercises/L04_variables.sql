USE sakila;
GO

DECLARE @myCity NVARCHAR(100) = 'Sasebo';

SELECT first_name, last_name, city
INTO #tmpTable
FROM dbo.customer c 
INNER JOIN dbo.address a ON c.address_id = a.address_id
INNER JOIN dbo.city ci ON a.city_id = ci.city_id
WHERE ci.city = @myCity

SELECT * FROM #tmpTable

DECLARE @nrCus INT;
SELECT @nrCus = COUNT(*) FROM #tmpTable

SELECT CONCAT_WS(' ', @nrCus, 'customer live in', @myCity)


DROP TABLE #tmpTable