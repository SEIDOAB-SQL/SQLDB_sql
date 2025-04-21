USE goodfriendsefc;
GO

--Change all addresses in Oslo to Oslo South
UPDATE dbo.Adress
SET City = 'Oslo South'
WHERE City = 'Oslo';

--Verify
SELECT a.Country, a.City, COUNT(*) [Nr of Friends] FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
GROUP BY a.Country, a.City;
