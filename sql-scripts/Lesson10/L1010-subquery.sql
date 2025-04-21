USE sakila;
GO

--As query by itself
(SELECT country_id FROM country WHERE country IN ('Germany', 'Italy'));

--As subquery
SELECT city_id, city 
FROM dbo.city
WHERE country_id IN (SELECT country_id FROM country WHERE country IN ('Germany', 'Italy'));

