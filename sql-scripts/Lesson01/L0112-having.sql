USE friends;
GO

--create a few more

INSERT INTO Pet
    (AnimalKind, Name, FriendId)
VALUES 
    ('Dog', 'Charlie', 3),
    ('Fish', 'Wanda', 6),
    ('Cat', 'Simba', 8);


SELECT AnimalKind, COUNT(*) AS NrAnimals FROM Pet  --Group by Row count
GROUP BY AnimalKind
HAVING COUNT(*) > 4;

