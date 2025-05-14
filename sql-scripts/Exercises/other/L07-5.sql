USE [sql-goodfriends];
GO

--Nr of Pets per friend
SELECT f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName) [Name], COUNT(p.PetId) FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
GROUP BY f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName);

--Nr of Pets where Friends have more than 1 pet
SELECT f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName) [Name], COUNT(p.PetId) FROM dbo.Friends f
INNER JOIN dbo.Pets p ON f.FriendId = p.OwnerFriendId
GROUP BY f.FriendId, CONCAT_WS(' ', f.FirstName, f.LastName)
HAVING COUNT(p.PetId) > 1;


SELECT a.Country, a.City, COUNT(PetId)  FROM dbo.Pets p 
INNER JOIN  dbo.Friends f ON f.FriendId = p.OwnerFriendId
INNER JOIN dbo.Addresses a ON a.AddressId = f.AddressId
GROUP BY a.Country, a.City WITH ROLLUP;


--Which are the top 5 most popular quotes
SELECT TOP 5 q.Quote, COUNT(f.FriendId) FROM dbo.Quotes q 
INNER JOIN dbo.csFriendcsQuote fq ON fq.QuotesQuoteId = q.QuoteId
INNER JOIN dbo.Friends f ON f.FriendId = fq.FriendsFriendId
GROUP BY  q.Quote
ORDER BY 2 DESC;

-- Nr of Friends that does not have a favorite Quote - step 1
SELECT q.QuoteId, q.QuoteText, f.FriendId, f.FirstName, f.LastName FROM dbo.Quotes q 
RIGHT OUTER JOIN dbo.FriendQuote fq ON fq.QuotesQuoteId = q.QuoteId
RIGHT OUTER JOIN dbo.Friends f ON f.FriendId = fq.FriendsFriendId
ORDER BY 3;

-- Nr of Friends that does not have a favorite Quote - step 2
SELECT COUNT(DISTINCT f.FriendId) FROM dbo.Quotes q 
RIGHT OUTER JOIN dbo.csFriendcsQuote fq ON fq.QuotesQuoteId = q.QuoteId
RIGHT OUTER JOIN dbo.Friends f ON f.FriendId = fq.FriendsFriendId
WHERE QuoteId IS NULL


SELECT COUNT(*) FROM dbo.Quotes