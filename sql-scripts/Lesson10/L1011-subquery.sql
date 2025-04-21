USE sakila;
GO

--Months of rental returns
SELECT DISTINCT DATENAME(month, return_date) FROM dbo.rental

--Months of payments
SELECT DISTINCT DATENAME(month, payment_date) FROM dbo.payment

--NOTE: NULL, September and February differs

--How much payments where made during months of movie returns
--September expected to be excluded
SELECT  DATENAME(month, payment_date) Month, SUM (amount)
FROM dbo.payment
WHERE DATENAME(month, payment_date) IN (SELECT DISTINCT DATENAME(month, return_date) FROM dbo.rental)
GROUP BY DATENAME(month, payment_date);

--How much payments where made during months of NO movie returns
--NULL is part of subquery - nothing returned
SELECT  DATENAME(month, payment_date) Month, SUM (amount)
FROM dbo.payment
WHERE DATENAME(month, payment_date) NOT IN (SELECT DISTINCT DATENAME(month, return_date) FROM dbo.rental)
GROUP BY DATENAME(month, payment_date);

--How much payments where made during months of NO movie returns
--NULL is considered and removed
SELECT  DATENAME(month, payment_date) Month, SUM (amount)
FROM dbo.payment
WHERE DATENAME(month, payment_date) NOT IN (
    SELECT DISTINCT DATENAME(month, return_date) FROM dbo.rental
    WHERE return_date IS NOT NULL)
GROUP BY DATENAME(month, payment_date);
