USE friends;
GO

INSERT INTO Friend
    (FirstName, LastName, Email, AddressId)
VALUES 
    ('Harry', 'Took', 'harry.took@gmail.com', 1),
    ('Severus', 'Gamgee', 'severus.gamgee@gmail.com', 2),
    ('Sam', 'Baggins', 'sam.baggins@gmail.com', 3),
    ('Saruman', 'Malfoy', 'saruman.malfoy@gmail.com', NULL),
    ('Lord', 'Dumbledore', NULL, 5),
    ('Hermione', 'Granger', NULL, 6),
    ('Albus', 'Potter', 'albus.potter@gmail.com', 7),
    ('Draco', 'Snape', 'draco.snape@gmail.com', 8);

    GO