USE musicefc;
GO

--Create some users
CREATE USER Hermione WITHOUT LOGIN;
CREATE USER Albus WITHOUT LOGIN;
CREATE USER Gandalf WITHOUT LOGIN;

--Create a role for common users
CREATE ROLE musicefcUsers;

--SELECT only rights, nothing can be damaged
GRANT SELECT ON dbo.Albums to musicefcUsers;
GRANT SELECT ON dbo.Artists to musicefcUsers;
GRANT SELECT ON dbo.MusicGroups to musicefcUsers;

ALTER ROLE musicefcUsers ADD MEMBER Hermione;
ALTER ROLE musicefcUsers ADD MEMBER Albus;
ALTER ROLE musicefcUsers ADD MEMBER Gandalf;
ALTER ROLE musicefcUsers ADD MEMBER Peregrin;

--Impersonate the users
EXECUTE AS USER = 'Albus';  -- try all different, Albus, Gandalf, Hermoine
--This works
SELECT * FROM dbo.Artists;

--But not this
INSERT INTO dbo.Artists VALUES
(NEWID(), 'Mary', 'Doe', NULL, NULL);

UPDATE dbo.Artists
SET FirstName = 'Mary'
WHERE ArtistId = '348d2195-37ab-4c8b-f351-08db56e0cbf8';

REVERT;

--Impersonate Peregrin
EXECUTE AS USER = 'Peregrin'; 
--This works
SELECT * FROM dbo.Artists;

--and this, as Peregrin as USER has been assigned INSERT rights
INSERT INTO dbo.Artists VALUES
(NEWID(), 'Mary', 'Doe', NULL, NULL);

--But not this
UPDATE dbo.Artists
SET FirstName = 'Mary'
WHERE ArtistId = '348d2195-37ab-4c8b-f351-08db56e0cbf8';

REVERT;
