USE [sql-goodfriends];
GO

SELECT a.Country, a.City, COUNT(*) [Nr of Friends] FROM dbo.Friends f
INNER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
GROUP BY a.Country, a.City;

--Change all addresses in Oslo to Oslo South
SELECT * FROM dbo.Adresses
/*
UPDATE dbo.Adresses
SET City = 'Bergen'
*/
WHERE City = 'Oslo';

--Verify
SELECT a.Country, a.City, COUNT(*) [Nr of Friends] FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
GROUP BY a.Country, a.City;
