USE musicefc;
GO

--cleanup
DROP USER Hermione;
DROP USER Albus;
DROP USER Gandalf;
DROP ROLE musicefcUsers;

--Let's create a musicefc database user and login from the C# entity framework core program
--Create a role for common users
DROP ROLE IF EXISTS musicefcUsers;
CREATE ROLE musicefcUsers;

--SELECT only rights to Role musicefcUsers to everything in SCHEMA usr
GRANT SELECT, EXECUTE ON SCHEMA::usr to musicefcUsers;

--Create a Login
CREATE LOGIN Frodo WITH PASSWORD=N'pa$$Word1', 
    DEFAULT_DATABASE=tempdb, DEFAULT_LANGUAGE=us_english, 
    CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;

--And a user
CREATE USER FrodoUser FROM LOGIN Frodo;
ALTER ROLE musicefcUsers ADD MEMBER FrodoUser;