USE sakila;
GO

--Let's get all ratings where the title includes 
SELECT rating FROM film WHERE title LIKE '%pet%'

--I can also use this query as a subquery directly in IN
SELECT title, rating
FROM film
WHERE rating IN (SELECT rating FROM film WHERE title LIKE '%pet%');

--Use LIKE to find all customers with lastname starting with L
SELECT * FROM dbo.customer
WHERE last_name LIKE 'L%'

--Use LIKE to find all customers where lastname has second letter O
SELECT * FROM dbo.customer
WHERE last_name LIKE '_O%'