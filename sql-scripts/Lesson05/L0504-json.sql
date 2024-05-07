USE friends;
GO

--Get full detail of a friend in JSON
SELECT f.FriendId , f.FirstName , f.LastName, 
    a.Country AS Country, CONCAT_WS(' ', p.Name, 'the happy', p.AnimalKind) AS Pet
FROM dbo.friend f
INNER JOIN dbo.Address a ON f.AddressId = a.AdressId
INNER JOIN dbo.Pet p ON f.FriendId = p.FriendId
FOR JSON PATH


--Transfer the file to SQL Server for reading
--   1. Click on the result so it opens up in a new Azure tab
--   2. save the tab as an json file, friends3.json. Make sure you do save as.. and select JSON format

--   Docker container
--   3. open a terminal in the directory of your xml file on the computer
--   4. copy the json file from your computer into the docker container: 
--         docker cp friends3.json sql2022container1:/tmp/

--   SQL Server Express
--   3. using FileExplorer open the the SQL Server Express backup directory.
--      e.g., C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup
--   4. copy friends3.json into the backup directory