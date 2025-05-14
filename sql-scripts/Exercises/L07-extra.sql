USE [sql-goodfriends];
GO

--Nr of Friends per Country and City
SELECT a.Country, a.City, COUNT(*) [Nr of Friends] FROM dbo.Friends f
INNER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
GROUP BY a.Country, a.City
ORDER BY 1, 2

--Nr of Friends per Country and City with ROLLUP
SELECT a.Country, a.City, COUNT(*) [Nr of Friends] FROM dbo.Friends f
INNER JOIN dbo.Addresses a ON f.AddressId = a.AddressId
GROUP BY a.Country, a.City WITH ROLLUP
ORDER BY 1, 2

--Nr of Pets per Country and City with ROLLUP
SELECT a.Country, a.City, COUNT(PetId)  FROM dbo.Pets p 
INNER JOIN  dbo.Friends f ON f.FriendId = p.OwnerFriendId
INNER JOIN dbo.Addresses a ON a.AddressId = f.AddressId
GROUP BY a.Country, a.City WITH ROLLUP
ORDER BY 1, 2;

--Which are the top 5 most popular quotes
SELECT TOP 5 q.QuoteText, COUNT(f.FriendId) FROM dbo.Quotes q 
INNER JOIN dbo.FriendQuote fq ON fq.QuotesQuoteId = q.QuoteId
INNER JOIN dbo.Friends f ON f.FriendId = fq.FriendsFriendId
GROUP BY  q.QuoteText
ORDER BY 2 DESC;

-- Nr of Friends that does not have a favorite Quote - step 1
SELECT q.QuoteId, q.QuoteText, f.FriendId, f.FirstName, f.LastName FROM dbo.Quotes q 
RIGHT OUTER JOIN dbo.FriendQuote fq ON fq.QuotesQuoteId = q.QuoteId
RIGHT OUTER JOIN dbo.Friends f ON f.FriendId = fq.FriendsFriendId
ORDER BY 3;

-- Nr of Friends that does not have a favorite Quote - step 2
SELECT COUNT(DISTINCT f.FriendId) FROM dbo.Quotes q 
RIGHT OUTER JOIN dbo.FriendQuote fq ON fq.QuotesQuoteId = q.QuoteId
RIGHT OUTER JOIN dbo.Friends f ON f.FriendId = fq.FriendsFriendId
WHERE QuoteId IS NULL

--Nr of Pets per friend
SELECT f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName) [Name], COUNT(p.PetId) FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
GROUP BY f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName);

--Nr of Pets where Friends have more than 1 pet
SELECT f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName) [Name], COUNT(p.PetId) FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
GROUP BY f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName)
HAVING COUNT(p.PetId) > 1;


--Which AnimalKind is most popular
SELECT TOP 1 AnimalKind, Count(AnimalKind) FROM dbo.Pets
GROUP BY AnimalKind
ORDER BY 2 DESC;

--Which AnimalKind is least popular
SELECT TOP 1 AnimalKind, Count(AnimalKind) FROM dbo.Pets
GROUP BY AnimalKind
ORDER BY 2 ASC;