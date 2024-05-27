--Ex 1.
--Create a Login with name, superuser, with goodfriendsefc as default database
--Create a Login with name, guestuser, with goodfriendsefc as default database
--Verify that you have created the logins by using
--Try login with Azure DataStudio, it will fail
USE master;
GO

CREATE LOGIN superuser WITH PASSWORD=N'pa$$Word1', 
    DEFAULT_DATABASE=goodfriendsefc, DEFAULT_LANGUAGE=us_english, 
    CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;

CREATE LOGIN guestuser WITH PASSWORD=N'pa$$Word1', 
    DEFAULT_DATABASE=goodfriendsefc, DEFAULT_LANGUAGE=us_english, 
    CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;

--Ex 2.
-- Create a user in goodfriendsefc, e.g. userSuperUser with Login superuser
-- Grant Connect to goodfriendsefc for userSuperUser
-- Try to connect with Azure DataStudio, it will now work
USE goodfriendsefc;
GO
CREATE USER userSuperUser FROM LOGIN superuser;
GRANT CONNECT to userSuperUser;

-- Create a role in goodfriendsefc, roleSuperUser that allows you to do everying in goodfriendsefc
-- Assign userSuperUser into roleSuperUser
-- Impersonate userSuperUsr and verify that you can access the tables and insert an new address
-- Revert back to sa
CREATE ROLE roleSuperUser;

--GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Adress to roleSuperUser;
--GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.csFriendcsQuote to roleSuperUser;
--GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Friends to roleSuperUser;
--GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Pets to roleSuperUser;
--GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Quotes to roleSuperUser;

--Grant to schema is an alternative
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::dbo TO roleSuperUser;

ALTER ROLE roleSuperUser ADD MEMBER userSuperUser;

EXECUTE AS USER = 'userSuperUser';
SELECT COUNT(*) FROM dbo.Adress;  -- this is ok.

INSERT INTO dbo.Adress VALUES -- this is ok
(NEWID(), 'A street', 12345, 'A city', 'A country', 1);

USE musicefc
GO          -- this is not ok

REVERT;

--Ex 3.
-- In goodfriendsefc create a view, vwPetNames that returns a list of Distinct Pet names from table Pets 
-- Create a user in goodfriendsefc, e.g. userGuestUser with Login guestuser
-- Grant Connect to goodfriendsefc for userGuestUser
-- Try to connect with Azure DataStudio, it will now work
USE goodfriendsefc;
GO
CREATE USER userGuestUser FROM LOGIN guestuser;
GRANT CONNECT to userGuestUser;

-- Create a role in goodfriendsefc, roleGuestUser that allows you to only select vwPetNames, nothing else
-- Assign userGuestUser into roleGuestUser
-- Impersonate userGuestUser and verify that you can access only the view
-- Revert back to sa

--Create the view for Ex 4
GO
CREATE OR ALTER VIEW vwPetNames AS
    SELECT DISTINCT Name FROM dbo.Pets
GO

CREATE ROLE roleGuestUser;
GRANT SELECT ON dbo.vwPetNames to roleGuestUser;

ALTER ROLE roleGuestUser ADD MEMBER userGuestUser;
ALTER ROLE roleGuestUser ADD MEMBER userSuperUser;

EXECUTE AS USER = 'userGuestUser';
SELECT * FROM dbo.vwPetNames;  -- this is ok.
SELECT DISTINCT Name FROM dbo.Pets  -- but not this, why?

REVERT;


--Ex 4.
-- Login as superuser and verify that you have superuser rights. Logout
-- Login as guestuser and verify that you have superuser rights. Logout


--Note, some HELPERS
--Show Server Logins
SELECT * FROM sys.sql_logins;

--Show Database roles and their members
SELECT DP1.name AS DatabaseRoleName,  ISNULL (DP2.name, 'No members') AS DatabaseUserName   
FROM sys.database_role_members AS DRM  
    RIGHT OUTER JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id  
    LEFT OUTER JOIN sys.database_principals AS DP2 ON DRM.member_principal_id = DP2.principal_id  
WHERE DP1.type = 'R'
ORDER BY DP1.name; 

--Show Who is logged in
SELECT USER AS UserName, SYSTEM_USER AS SystemUserName,
       ORIGINAL_LOGIN() AS OriginalLoginName;

--Show Database based users
SELECT * FROM sys.database_principals
WHERE type_desc = 'SQL_USER'





--Clean up
REVERT;
ALTER ROLE roleSuperUser DROP MEMBER userSuperUser;
ALTER ROLE roleGuestUser DROP MEMBER userGuestUser;
DROP ROLE roleSuperUser;
DROP ROLE roleGuestUser;
DROP VIEW vwPetNames;
DROP USER userSuperUser;
DROP USER userGuestUser;
DROP LOGIN superuser;
DROP LOGIN guestuser;