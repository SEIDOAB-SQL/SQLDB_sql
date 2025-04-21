USE sakila;
GO

SELECT COUNT(*) AS CounRows,
    COUNT(customer_id) AS CountCustId,
    COUNT(DISTINCT customer_id) AS CountDistinctCustId
FROM dbo.payment;

SELECT COUNT(*) AS CountRows,
    COUNT(postal_code) AS CountZipCode,
    COUNT(DISTINCT postal_code) AS CountDistinctZipCode
FROM dbo.address;

SELECT COUNT(*) AS CountRows
FROM dbo.address
WHERE postal_code IS NULL;
