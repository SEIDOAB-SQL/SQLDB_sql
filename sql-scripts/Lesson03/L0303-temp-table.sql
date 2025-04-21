USE Friends;
GO

--using SELECT INTO I do not need to declare the #temp table before. It is created in the SELECT

--fill the table using Select from Pet linked with friend
SELECT p.Name AS petName, CONCAT_WS(' ', f.FirstName, f.LastName) AS ownerName, 
       ISNULL(f.Email, 'No email available') AS ownerEmail
INTO #PetList
FROM dbo.Pet AS p 
    INNER JOIN dbo.Friend AS f ON p.FriendId = f.FriendId;


--see what we got
SELECT * FROM #PetList;

--remove the temp table
DROP TABLE #PetList;

