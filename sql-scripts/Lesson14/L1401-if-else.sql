USE sakila;
GO

DECLARE @Count INT;

SELECT @Count = COUNT(*) FROM dbo.customer;
IF @Count >= 500 AND DATENAME(WEEKDAY, GETDATE()) ='Monday' 
BEGIN
    PRINT 'The count is over 500.';
    PRINT 'Today is Monday.';
END;
ELSE BEGIN
    PRINT 'Either the customer count is less than 500 or today is not Monday.';
    PRINT 'Actually today is a ' + DATENAME(WEEKDAY, GETDATE());
END;

--Use IF with a SubQuery
IF EXISTS (SELECT 1 FROM dbo.rental WHERE return_date IS NULL)
BEGIN
   PRINT 'There are rentals not returned';
END;
ELSE BEGIN
   PRINT 'All rentals are returned';
END; 


--Use IF with a CTE
;WITH multiple_names AS 
    (SELECT first_name, COUNT (first_name) as name_count FROM dbo.customer
     GROUP BY first_name
     HAVING COUNT (first_name)>1)
SELECT @Count = COUNT(*) FROM multiple_names;

IF @Count > 0
BEGIN
   --Note the CAST
   PRINT 'You have ' + CAST(@Count AS NVARCHAR) + ' persons in the database who are sharing their first name'
END
