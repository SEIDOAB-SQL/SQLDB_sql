USE friends;
GO

DELETE dbo.Pet
WHERE [Name] = 'Wanda';

GO

/*
INSERT INTO Pet
    (AnimalKind, Name, FriendId)
VALUES 
    ('Fish', 'Wanda', 2),
    ('Cat', 'Wanda', 3);

    GO
*/