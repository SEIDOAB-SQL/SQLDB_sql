DECLARE @City NVARCHAR(20) = 'Bergen'
DECLARE @AnimalKind NVARCHAR(20) = 'Rabbit'

;WITH friends AS
(SELECT FriendId, City FROM dbo.Friends f
  INNER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
  WHERE a.City = @City
),
pets AS
(
    SELECT * FROM friends f
    INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
    WHERE AnimalKindString = @AnimalKind
)

SELECT * FROM pets;