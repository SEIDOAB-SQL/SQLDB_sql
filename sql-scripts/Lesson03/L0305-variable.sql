USE friends;
GO

DECLARE @aPet NVARCHAR(200)

--multiple rows are returned so @aPet will be assigned last row.
SELECT @aPET = CONCAT_WS(' ', p.Name, 'the lazy', p.AnimalKind, 'is owned by', f.FirstName, f.LastName)
FROM dbo.Pet AS p 
    INNER JOIN dbo.Friend AS f ON p.FriendId = f.FriendId;

SELECT @aPet;

--PRINT is shown in Azure Stuido tab Messages
PRINT @aPet;

--WHERE is used to return only 1 row
SELECT @aPET = CONCAT_WS(' ', p.Name, 'the lazy', p.AnimalKind, 'is owned by', f.FirstName, f.LastName)
FROM dbo.Pet AS p 
    INNER JOIN dbo.Friend AS f ON p.FriendId = f.FriendId
WHERE p.PetId = 11;

SELECT @aPet;
PRINT @aPet;

