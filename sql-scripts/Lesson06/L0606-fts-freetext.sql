USE sakila;
GO

--searching for word
SELECT * FROM dbo.film WHERE FREETEXT(*,'amazing');

--searching any of the words
SELECT * FROM dbo.film WHERE FREETEXT(*,'amazing epistle boy');

