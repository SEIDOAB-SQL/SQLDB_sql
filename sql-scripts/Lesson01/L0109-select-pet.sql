USE friends;
GO

SELECT * FROM dbo.Pet;

SELECT AnimalKind FROM dbo.Pet;

SELECT DISTINCT AnimalKind FROM dbo.Pet;

--create a few more
INSERT INTO Pet
    (AnimalKind, Name, FriendId)
VALUES 
    ('Cat', 'Charlie', 3),
    ('Cat', 'Wanda', 7),
    ('Dog', 'Simba', 8);

    SELECT DISTINCT AnimalKind FROM dbo.Pet;

GO
