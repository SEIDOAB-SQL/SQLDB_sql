USE musicefc;
GO

--I am in musicefc, but as sa - system administrator
CREATE USER Peregrin WITHOUT LOGIN;

--Impersonate Peregring
EXECUTE AS USER = 'Peregrin'; 

--Cannot change db or even select in musicefc
USE friends;
GO
USE musicefc;
GO
SELECT * FROM dbo.Artists;

--Go back to being a system administrator
REVERT;

--Give Peregring som rigths
GRANT SELECT, INSERT ON dbo.Artists TO Peregrin;

--Impersonate Peregring
EXECUTE AS USER = 'Peregrin'; 

--This works
SELECT * FROM dbo.Artists;
INSERT INTO dbo.Artists VALUES
(NEWID(), 'Mary', 'Doe', NULL, NULL);

--But not this
UPDATE dbo.Artists
SET FirstName = 'Mary'
WHERE ArtistId = '348d2195-37ab-4c8b-f351-08db56e0cbf8';

REVERT;