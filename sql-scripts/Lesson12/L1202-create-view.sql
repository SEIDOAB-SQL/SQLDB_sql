USE sakila;
GO

DROP VIEW IF EXISTS dbo.vw_customer_store;
GO

CREATE VIEW dbo.vw_customer_store AS
    SELECT * 
    FROM dbo.vw_customer AS vc
    INNER JOIN dbo.vw_store AS vs ON vc.[sto id] = vs.[store id];
GO

SELECT TOP 5 * FROM dbo.vw_customer_store;
