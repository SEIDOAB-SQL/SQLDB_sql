USE Friends;
GO

--Create temp table
CREATE TABLE #PetList(
    petName NVARCHAR(50),
    ownerName NVARCHAR(400),
    ownerEmail NVARCHAR(200));
GO


--fill the table using Select from Pet linked with friend
INSERT INTO #PetList(petName, ownerName, ownerEmail)
SELECT p.Name, CONCAT_WS(' ', f.FirstName, f.LastName), ISNULL(f.Email, 'No email available')
FROM dbo.Pet AS p 
    INNER JOIN dbo.Friend AS f ON p.FriendId = f.FriendId;


--see what we got
SELECT * FROM #PetList;

--remove the temp table
DROP TABLE #PetList;
