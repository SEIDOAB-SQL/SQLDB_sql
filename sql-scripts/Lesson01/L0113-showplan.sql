
USE friends;
GO

SET SHOWPLAN_ALL ON;
GO

SELECT * FROM dbo.Friend
WHERE Email IS NOT NULL
ORDER BY LastName DESC;

SELECT AnimalKind, COUNT(*) AS NrAnimals FROM Pet  --Group by Row count
GROUP BY AnimalKind
HAVING COUNT(*) > 4
ORDER BY 2 ASC;