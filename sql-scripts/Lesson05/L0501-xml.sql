USE friends;
GO

--Get full detail of a friend in XML
SELECT * 
FROM dbo.friend Friend
INNER JOIN dbo.Address [Address]
ON friend.AddressId = [Address].AdressId
INNER JOIN dbo.Pet Pet
ON Friend.FriendId = Pet.FriendId
FOR XML AUTO

--I can set a variable using a select statement as subquery, as long as it is returning only one result
DECLARE @myVar nvarchar(200);
SET @myVar = (SELECT Name From dbo.Pet WHERE PetId = 3);
PRINT @myVar;

--I can use this to write to an XML variable
DECLARE @myXML XML;

--Get full detail of a friend in XML
SET @myXML = (SELECT * 
FROM dbo.friend Friend
INNER JOIN dbo.Address [Address]
ON friend.AddressId = [Address].AdressId
INNER JOIN dbo.Pet Pet
ON Friend.FriendId = Pet.FriendId
FOR XML AUTO);

SELECT @myXML;

--you can store it in an xml file using azure data studio. 
--I modified so it can be opened in Excel
--   1. Click on the result so it opens up in a new Azure tab
--   2. open xml-frame.xml and wrap the xml result in step 1 in the root tag 
--   2. save the tab as an xml file, friends1.xml. Make sure you do save as.. and select XML format

