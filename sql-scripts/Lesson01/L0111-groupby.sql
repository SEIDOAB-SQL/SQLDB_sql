USE friends;
GO

SELECT COUNT(*) FROM Address  --Group by Row count
GROUP BY Country;

GO


SELECT AnimalKind, COUNT(*) AS NrAnimals FROM Pet  --Group by Row count
GROUP BY AnimalKind;

GO

/*
--create a few more
INSERT INTO Pet
    (AnimalKind, Name, FriendId)
VALUES 
    ('Cat', 'Charlie', 13),
    ('Cat', 'Wanda', 11),
    ('Dog', 'Simba', 9);
*/

SELECT AnimalKind, COUNT(*) AS NrAnimals FROM Pet  --Group by Row count
GROUP BY AnimalKind;

