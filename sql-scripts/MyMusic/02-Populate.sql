USE myMusic;
GO

INSERT INTO dbo.MusicGroups (Name, EstablishedYear)
VALUES
    ('AC/DC', 1973),
    ('Bob Dylan', 1962),
    ('Bob Marley', 1967)

INSERT INTO dbo.Artists (FirstName, LastName, MusicGroupId)
VALUES
    ('Bon', 'Scott', 1 ),
    ('Angus', 'Young', 1),
    ('Robert', 'Zimmerman', 2),
    ('Robert', 'Marley', 3),
    ('Rita', 'Marley', 3)

INSERT INTO dbo.Albums (Name, ReleaseYear, MusicGroupId)
VALUES
    ('Kaya', 1974, 3),
    ('High Voltage', 1974, 1),
    ('Infidels', 1979, 2)

UPDATE dbo.MusicGroups
SET MostSoldAlbumId = 1
WHERE MusicGroupId = 3