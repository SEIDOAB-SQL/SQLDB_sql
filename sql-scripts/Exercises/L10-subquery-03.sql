SELECT TOP 1 a.city [city], COUNT (DISTINCT p.PetId) FROM dbo.Pets p 
INNER JOIN dbo.Friends f ON f.FriendId = p.OwnerFriendId
INNER JOIN dbo.Adress a ON a.AdressId = f.AdressId
GROUP BY a.city
ORDER BY 2 ASC
--Stockholm

SELECT city FROM (
    SELECT TOP 1 a.city as [city], COUNT (DISTINCT p.PetId) as [count] FROM dbo.Pets p 
    INNER JOIN dbo.Friends f ON f.FriendId = p.OwnerFriendId
    INNER JOIN dbo.Adress a ON a.AdressId = f.AdressId
    GROUP BY a.city
    ORDER BY 2 ASC) c;


SELECT TOP 2 p.AnimalKind as [AnimalKind], COUNT (DISTINCT p.PetId) as [Count] FROM dbo.Pets p 
INNER JOIN dbo.Friends f ON f.FriendId = p.OwnerFriendId
INNER JOIN dbo.Adress a ON a.AdressId = f.AdressId
WHERE a.city = (
    SELECT city FROM (
        SELECT TOP 1 a.city as [city], COUNT (DISTINCT p.PetId) as [count] FROM dbo.Pets p 
        INNER JOIN dbo.Friends f ON f.FriendId = p.OwnerFriendId
        INNER JOIN dbo.Adress a ON a.AdressId = f.AdressId
        GROUP BY a.city
        ORDER BY 2 ASC) c
)
GROUP BY AnimalKind
ORDER BY 2 ASC

SELECT AnimalKind FROM (
    SELECT TOP 2 p.AnimalKind as [AnimalKind], COUNT (DISTINCT p.PetId) as [Count] FROM dbo.Pets p 
    INNER JOIN dbo.Friends f ON f.FriendId = p.OwnerFriendId
    INNER JOIN dbo.Adress a ON a.AdressId = f.AdressId
    WHERE a.city = (
        SELECT city FROM (
            SELECT TOP 1 a.city as [city], COUNT (DISTINCT p.PetId) as [count] FROM dbo.Pets p 
            INNER JOIN dbo.Friends f ON f.FriendId = p.OwnerFriendId
            INNER JOIN dbo.Adress a ON a.AdressId = f.AdressId
            GROUP BY a.city
            ORDER BY 2 ASC) c
    )
    GROUP BY AnimalKind
    ORDER BY 2 ASC) a

-- 0, 2 


SELECT * FROM dbo.Friends f
INNER JOIN dbo.Pets p ON p.OwnerFriendId = f.FriendId
WHERE p.AnimalKind IN (
    SELECT AnimalKind FROM (
    SELECT TOP 2 p.AnimalKind as [AnimalKind], COUNT (DISTINCT p.PetId) as [Count] FROM dbo.Pets p 
    INNER JOIN dbo.Friends f ON f.FriendId = p.OwnerFriendId
    INNER JOIN dbo.Adress a ON a.AdressId = f.AdressId
    WHERE a.city = (
        SELECT city FROM (
            SELECT TOP 1 a.city as [city], COUNT (DISTINCT p.PetId) as [count] FROM dbo.Pets p 
            INNER JOIN dbo.Friends f ON f.FriendId = p.OwnerFriendId
            INNER JOIN dbo.Adress a ON a.AdressId = f.AdressId
            GROUP BY a.city
            ORDER BY 2 ASC) c
    )
    GROUP BY AnimalKind
    ORDER BY 2 ASC) a
)


SELECT COUNT (*) FROM Friends f 
INNER JOIN Pets p ON p.OwnerFriendId = f.FriendId
WHERE p.AnimalKind = 0 AND p.Name = 'Wanda';


SELECT COUNT (*) FROM Friends f 
WHERE EXISTS (
    SELECT 1 FROM Pets p 
    WHERE f.FriendId = p.OwnerFriendId AND p.AnimalKind = 0 AND p.Name = 'Wanda'
    )
