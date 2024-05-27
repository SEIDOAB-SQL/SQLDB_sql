--Ex 1.
--Create a Login with name, superuser, with goodfriendsefc as default database
--Create a Login with name, guestuser, with goodfriendsefc as default database
--Verify that you have created the logins by using


--Ex 2.
-- Create a user in goodfriendsefc, e.g. userSuperUser with Login superuser
-- Create a role in goodfriendsefc, roleSuperUser that allows you to do everying in goodfriendsefc
-- Assign userSuperUser into roleSuperUser
-- Impersonate userSuperUsr and verify that you can access the tables and insert an new address
-- Revert back to sa


--Ex 3.
-- In goodfriendsefc create a view, vwPetNames that returns a list of Distinct Pet names from table Pets 
-- Create a user in goodfriendsefc, e.g. userGuestUser with Login guestuser
-- Create a role in goodfriendsefc, roleGuestUser that allows you to only select vwPetNames, nothing else
-- Assign userGuestUser into roleGuestUser
-- Impersonate userGuestUser and verify that you can access only the view
-- Revert back to sa


--Ex 4.
-- Login as superuser and verify that you have superuser rights. Logout
-- Login as guestuser and verify that you have superuser rights. Logout


--Note, some help
--Show Server Logins
SELECT * FROM sys.sql_logins;

--Show Database roles and their members
SELECT DP1.name AS DatabaseRoleName,  ISNULL (DP2.name, 'No members') AS DatabaseUserName   
FROM sys.database_role_members AS DRM  
    RIGHT OUTER JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id  
    LEFT OUTER JOIN sys.database_principals AS DP2 ON DRM.member_principal_id = DP2.principal_id  
WHERE DP1.type = 'R'
ORDER BY DP1.name; 


--Show Database based users
SELECT * FROM sys.database_principals
WHERE type_desc = 'SQL_USER'
