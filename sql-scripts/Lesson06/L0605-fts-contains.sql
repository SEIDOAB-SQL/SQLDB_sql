USE sakila;
GO

--Look into all columns
SELECT * FROM dbo.film WHERE CONTAINS(*,'dinosaur');

--Look into specific column
SELECT * FROM dbo.film WHERE CONTAINS(title,'dinosaur');
SELECT * FROM dbo.film WHERE CONTAINS((title, description),'dinosaur');

--using multiple terms NEAR AND OR NOT
SELECT * FROM dbo.film WHERE CONTAINS(*,'robot NEAR boy');

SELECT * FROM dbo.film WHERE CONTAINS(*,'robot NEAR boy AND NOT car');

SELECT * FROM dbo.film WHERE CONTAINS(*,'robot NEAR boy AND NOT car');

--Look for exact phrases
SELECT * FROM dbo.film WHERE CONTAINS(*,'"astounding story" AND NOT dog');
