USE friends;
GO

INSERT INTO Pet
    (AnimalKind, Name, FriendId)
VALUES 
    ('Cat', 'Charlie', 1),
    ('Fish', 'Wanda', 2),
    ('Dog', 'Simba', 5),
    ('Bird', 'Max', 5),
    ('Cat', 'Cooper', 3),
    ('Dog', 'Milo', 7),
    ('Fish', 'Teddy', 8),
    ('Bird', 'Leo', 8);

    GO
    
    SELECT * FROM dbo.Friend f
    INNER JOIN dbo.Address a ON  f.AddressId = a.AdressId
    INNER JOIN dbo.Pet p ON f.FriendId = p.FriendId;

    SELECT * FROM dbo.Friend;

    SELECT * FROM dbo.Address;

    UPDATE dbo.Friend
    SET AddressId = 2
    WHERE FriendId = 3;

    SELECT * FROM dbo.Friend
    WHERE FriendId = 3;

    SELECT * FROM dbo.Pet
    WHERE AnimalKind = 'Bird'

    UPDATE dbo.Pet
    SET Name = 'Wanda'
    WHERE PetId = 32

    DELETE dbo.Pet
    WHERE PetId = 18 OR PetId = 19


    UPDATE dbo.Pet
    SET Name = 'Wanda Wande'
    WHERE AnimalKind = 'Fish' AND [Name] = 'Wanda'

    SELECT * FROM dbo.Pet
    WHERE AnimalKind = 'Fish' AND [Name] = 'Wanda'