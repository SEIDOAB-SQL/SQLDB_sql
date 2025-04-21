USE sakila;
GO

DECLARE @customer_id INT;
DECLARE @fullname NVARCHAR(200);

DECLARE customer_cursor CURSOR FAST_FORWARD 
FOR
    SELECT customer_id, CONCAT_WS(' ', first_name, last_name)
    FROM dbo.customer;


OPEN customer_cursor;
FETCH NEXT FROM customer_cursor INTO @customer_id, @fullname;

WHILE @@FETCH_STATUS = 0 BEGIN

    PRINT 'Do something with customer_id: ' + CAST (@customer_id AS NVARCHAR);
    PRINT '  - customer name: ' + @fullname;
    PRINT 'Done';

    FETCH NEXT FROM customer_cursor INTO @customer_id, @fullname;
END

CLOSE customer_cursor;
DEALLOCATE customer_cursor;
