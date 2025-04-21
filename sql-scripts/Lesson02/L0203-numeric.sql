USE sakila;
GO

-- Apply a discount on the top 5 of the most expensive films
SELECT TOP 5 title, rental_rate, rental_rate * 0.5 FROM dbo.film ORDER BY 2 DESC;

-- Let's floor it
SELECT TOP 5 title, rental_rate, FLOOR(rental_rate * 0.5) FROM dbo.film ORDER BY 2 DESC;

-- Let's ceiling it
SELECT TOP 5 title, rental_rate, CEILING(rental_rate * 0.5) FROM dbo.film ORDER BY 2 DESC;

-- Let's Round it
SELECT TOP 5 title, rental_rate, ROUND(rental_rate * 0.5, 1) FROM dbo.film ORDER BY 2 DESC;


SELECT CEILING(72.445), FLOOR(72.445), ROUND(17.445, 1);
SELECT ROUND(17.5, 1), ROUND(17.5, 0), ROUND(17.5, -1);

--mod operator %
SELECT 0%2 as even, 1%2 AS odd, 2%2 as even, 3%2 as odd; 

