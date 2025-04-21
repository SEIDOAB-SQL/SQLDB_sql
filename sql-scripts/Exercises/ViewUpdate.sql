USE sakila;
GO


CREATE OR ALTER VIEW dbo.vw_customer AS
    SELECT c.customer_id [cus id], c.first_name [cus first name], 
        c.last_name [cus last name], cty.country [cus country]
    FROM dbo.customer AS c
    
    INNER JOIN dbo.address AS a ON c.address_id = a.address_id
    INNER JOIN dbo.city AS ci ON a.city_id = ci.city_id
    INNER JOIN dbo.country AS cty ON ci.country_id = cty.country_id;
GO

SELECT [cus country], COUNT([cus id]) FROM dbo.vw_customer
WHERE [cus country] IN ('Sweden', 'Japan')
GROUP BY [cus country]

SELECT TOP 1 * FROM dbo.vw_customer WHERE [cus country] = 'Japan';

BEGIN TRANSACTION
    UPDATE dbo.vw_customer
    SET [cus country] = 'Sweden'
    WHERE [cus id] = 574

    SELECT [cus country], COUNT([cus id]) FROM dbo.vw_customer
    WHERE [cus country] IN ('Sweden', 'Japan')
    GROUP BY [cus country]
ROLLBACK;

SELECT [cus country], COUNT([cus id]) FROM dbo.vw_customer
WHERE [cus country] IN ('Sweden', 'Japan')
GROUP BY [cus country]
