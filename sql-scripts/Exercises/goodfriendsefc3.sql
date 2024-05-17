USE goodfriendsefc;
GO

--Nr of Adresses
SELECT COUNT(*) [Nr of Adresses]FROM dbo.Adress;
--Nr of Unique Adresses
SELECT COUNT(DISTINCT CONCAT (' ', StreetAdress, ZipCode, City, Country)) [Nr of Unique Adresses]FROM dbo.Adress;

--Nr of Friends per Country
SELECT a.Country, COUNT(*) [Nr of Friends] FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
GROUP BY a.Country;

--Nr of Friends per Country and City
SELECT a.Country, a.City, COUNT(*) [Nr of Friends] FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
GROUP BY a.Country, a.City;

--Nr of Friends per Country and City with ROLLUP
SELECT a.Country, a.City, COUNT(*) [Nr of Friends] FROM dbo.Friends f
INNER JOIN dbo.Adress a ON f.AdressId = a.AdressId
GROUP BY a.Country, a.City WITH ROLLUP;