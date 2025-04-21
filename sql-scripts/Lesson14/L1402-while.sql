USE sakila;
GO

PRINT '';
PRINT 'Simple WHILE loop';
DECLARE @Count INT = 1;
WHILE @Count < 10 BEGIN
    PRINT @Count;
    SET @Count += 1;
END;

PRINT '';
PRINT 'WHILE loop using BREAK';
SET @Count = 1;
WHILE @Count < 50  BEGIN
    PRINT @Count;
    IF @Count = 10 BEGIN
        PRINT 'Exiting the WHILE loop';
        BREAK;
END; 
    SET @Count += 1;
END;

PRINT '';
PRINT 'WHILE loop using CONTINUE';
SET @Count = 1;
WHILE @Count < 10 BEGIN
    PRINT @Count;
    SET @Count += 1;
    IF @Count = 3 BEGIN
       PRINT 'Skip using CONTINUE';
       CONTINUE;
    END; 
END;
