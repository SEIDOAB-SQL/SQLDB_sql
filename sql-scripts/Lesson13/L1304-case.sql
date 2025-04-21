USE sakila;
GO

--Simple case expression
SELECT first_name, last_name,
    --simple case stement produces a column in the SELCT statement 
    CASE active
        WHEN 1 THEN 'Is an active customer'

        --do you remember the CONVERT statement from datetime -> string conversion
        WHEN 0 THEN 'In not an active customer, since ' + CONVERT(NVARCHAR, last_update, 111)
        ELSE 'Unknown status'
    END AS [customer status]
FROM dbo.customer
WHERE customer_id IN (1,5,16,357,358,592,7);

--searched case expression
SELECT first_name, last_name, store_id,
    --simple case stement produces a column in the SELCT statement 
    CASE 
        WHEN active = 1 AND store_id = 2 THEN 'Is an active customer in store_id 2'
        WHEN active = 1 AND store_id = 1 THEN 'Is an active customer in store_id 1'

        --checkout the FORMAT statement from datetime -> string conversion
        WHEN active = 0 THEN 'In not an active customer, since ' + FORMAT(last_update, 'yyyy.MM.d')
        ELSE 'Unknown status'
    END AS [customer status]
FROM dbo.customer
WHERE customer_id IN (1,5,16,357,358,592,7);
