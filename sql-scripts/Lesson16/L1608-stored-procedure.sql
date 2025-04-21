USE sakila;
GO

--You can basically wrap any complex SQL within a user defined stored procedure
CREATE PROCEDURE dbo.udp_ActorsMovieRevenue
    @ln_like NVARCHAR(200), 
    @rating NVARCHAR(50) AS

--beginning CTE part
;WITH actors AS
    (SELECT actor_id, first_name, last_name FROM actor 
     WHERE last_name LIKE @ln_like)

-- Use a comma to separate multiple CTE definitions.
,
actors_movies AS
    (SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
     FROM actors a 
     INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
     INNER JOIN film f ON f.film_id = fa.film_id
     WHERE f.rating = @rating)

-- Use a comma to separate multiple CTE definitions.
, 
actors_movies_revenue AS (
    SELECT am.first_name, am.last_name, p.amount 
        FROM actors_movies am 
            INNER JOIN inventory i ON i.film_id = am.film_id
            INNER JOIN rental r ON i.inventory_id = r.inventory_id
            INNER JOIN payment p ON r.rental_id = p.rental_id)
-- end of With clause

-- start of the SELECT using the CTE defined 
SELECT amr.first_name, amr.last_name, SUM (amr.amount) tot_revenue
FROM actors_movies_revenue amr
GROUP BY amr.first_name, amr.last_name
ORDER BY 3 DESC;

GO

--To get the result set of a Stored procedure into a table
--You have to create the temp table
CREATE TABLE #tmpTable(first_name NVARCHAR(200), last_name NVARCHAR(200), tot_revenue MONEY);

-- Fill a temp table with the result using INSERT INTO
INSERT INTO #tmpTable EXEC dbo.udp_ActorsMovieRevenue 'S%', 'PG';
SELECT * FROM #tmpTable;

-- Or a table variable
DECLARE @tmpTable TABLE (
        first_name NVARCHAR(200), 
        last_name NVARCHAR(200), 
        tot_revenue MONEY);
        
INSERT INTO @tmpTable EXEC dbo.udp_ActorsMovieRevenue 'S%', 'PG';
SELECT * FROM @tmpTable;



--House cleaning
DROP TABLE IF EXISTS #tmpTable
DROP PROCEDURE IF EXISTS dbo.udp_ActorsMovieRevenue;
