USE sakila;
GO

SELECT COUNT(*) AS CountOfRows,
    MAX(amount) AS MaxAmount,
    MIN(amount) AS MinAmount,
    SUM(amount) AS SumOfAmount,
    AVG(amount) AS AvgAmount
FROM dbo.payment;
