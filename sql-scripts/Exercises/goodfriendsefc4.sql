USE goodfriendsefc;
GO

--Nr of Pets
SELECT COUNT(*) FROM dbo.Pets

--Nr of Pets per AnimalKind
SELECT AnimalKind, Count(AnimalKind) FROM dbo.Pets
GROUP BY AnimalKind;

--Which AnimalKind is most popular
SELECT TOP 1 AnimalKind, Count(AnimalKind) FROM dbo.Pets
GROUP BY AnimalKind
ORDER BY 2 DESC;

--Which AnimalKind is least popular
SELECT TOP 1 AnimalKind, Count(AnimalKind) FROM dbo.Pets
GROUP BY AnimalKind
ORDER BY 2 ASC;