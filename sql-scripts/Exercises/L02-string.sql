-- hex -> unicode
-- https://www.rapidtables.com/code/text/unicode-characters.html
SELECT NCHAR(0x00A9), NCHAR(0x00DF); 

USE [sql-music]
GO

SELECT CONCAT_WS(N' ', N'The band', Name, N'was established', EstablishedYear) FROM dbo.MusicGroups;

SELECT   SUBSTRING (Name, 1, 3), SUBSTRING (Name, LEN(Name)-2, 3)
FROM dbo.MusicGroups;

SELECT  CONCAT('', SUBSTRING (Name, 1, 3), MusicGroupId, SUBSTRING (Name, LEN(Name)-2, 3))
FROM dbo.MusicGroups;
