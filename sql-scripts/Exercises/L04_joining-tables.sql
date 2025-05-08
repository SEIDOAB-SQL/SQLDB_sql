USE [sql-goodfriends];
GO

SELECT *
  FROM [sql-goodfriends].[dbo].[FriendQuote]
WHERE QuotesQuoteId = 'a1ee645e-a297-403a-b870-035ce3e60082'

DELETE
  FROM [sql-goodfriends].[dbo].[FriendQuote]
WHERE QuotesQuoteId = 'a1ee645e-a297-403a-b870-035ce3e60082'

SELECT f.FriendId, f.FirstName, f.LastName, q.QuoteText FROM dbo.Friends f 
FULL OUTER JOIN dbo.FriendQuote fq ON f.FriendId = fq.FriendsFriendId
FULL OUTER JOIN dbo.Quotes q ON fq.QuotesQuoteId = q.QuoteId
ORDER BY 3;