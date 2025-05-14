USE [sql-goodfriends];
GO

--Nr of Adresses
SELECT COUNT(*) [Nr of Adresses]FROM dbo.Addresses;
--Nr of Unique Adresses - elegant
SELECT COUNT(DISTINCT CONCAT (' ', Street, ZipCode, City, Country)) [Nr of Unique Addresses]FROM dbo.Addresses;

--Nr of Unique Adresses - general
SELECT COUNT(*) FROM (SELECT DISTINCT Street, ZipCode, City, Country [Nr of Unique Addresses]FROM dbo.Addresses) a;

--Nr of Pets
SELECT COUNT(*) FROM dbo.Pets

--Nr of Pets per AnimalKind
SELECT TOP 2 AnimalKindString, Count(*) FROM dbo.Pets
GROUP BY AnimalKindString
ORDER BY 2 DESC;



-- Complex example of finding persons with popular animals
DECLARE @PoularAnimalKind NVARCHAR(50)
SELECT @PoularAnimalKind = a.akind FROM 
    (SELECT TOP 1 AnimalKindString as akind, Count(*) as anr FROM dbo.Pets
    GROUP BY AnimalKindString
    ORDER BY 2 DESC) a;

SELECT FriendId, AnimalKindString FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
WHERE p.AnimalKindString = @PoularAnimalKind


SELECT FriendId, AnimalKindString FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
WHERE p.AnimalKindString IN
(SELECT a.akind FROM 
    (SELECT TOP 2 AnimalKindString as akind, Count(*) as anr FROM dbo.Pets
    GROUP BY AnimalKindString
    ORDER BY 2 DESC) a)