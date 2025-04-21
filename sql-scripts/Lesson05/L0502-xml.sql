USE friends;
GO

--Get full detail of a friend in XML
SELECT f.FriendId "@FriendId", f.FirstName "FirstName", f.LastName "LastName", 
    a.Country "Country", a.Country "City", CONCAT_WS(' ', p.Name, 'the happy', p.AnimalKind) "Pet"
FROM dbo.friend f
INNER JOIN dbo.Address a
ON f.AddressId = a.AdressId
INNER JOIN dbo.Pet p
ON f.FriendId = p.FriendId
FOR XML PATH('Friend')

--Transfer the file to SQL Server for reading
--   1. Click on the result so it opens up in a new Azure tab
--   2. save the tab as an xml file, friends2.xml. Make sure you do save as.. and select XML format

--   Docker container
--   3. open a terminal in the directory of your xml file on the computer
--   4. copy the image file from your computer into the docker container: 
--         docker cp friends2.xml sql2022container1:/tmp/

--   SQL Server Express
--   3. using FileExplorer open the the SQL Server Express backup directory.
--      e.g., C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup
--   4. copy friends2.xml into the backup directory