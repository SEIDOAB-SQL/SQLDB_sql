USE friends;
GO

SELECT * FROM dbo.Pet;

UPDATE Pet
SET Name = 'Wanda'
WHERE PetId = 6;

SELECT * FROM dbo.Pet;

GO

