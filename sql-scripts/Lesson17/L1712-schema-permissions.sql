USE musicefc;
GO

--create a schema that I will assign permissons to role
CREATE SCHEMA usr;
GO

--create usr. views from the dbo. tables
CREATE VIEW usr.vwMusicGroups AS
SELECT * FROM dbo.MusicGroups;
GO

CREATE VIEW usr.vwAlbums AS
SELECT * FROM dbo.Albums;
GO

CREATE VIEW usr.vwArtists AS
SELECT * FROM dbo.Artists;
GO


--Create a role for common users
CREATE ROLE musicefcUsers;

--SELECT only rights to Role musicefcUsers to everything in SCHEMA usr
GRANT SELECT, EXECUTE ON SCHEMA::usr to musicefcUsers;

