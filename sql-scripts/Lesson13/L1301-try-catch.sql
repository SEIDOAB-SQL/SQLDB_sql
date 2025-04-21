USE friends;
GO


BEGIN TRY
    PRINT 1/0;
END TRY
BEGIN CATCH
    PRINT 'Inside the Catch block';
    PRINT ERROR_NUMBER();
    PRINT ERROR_MESSAGE();
    PRINT ERROR_LINE();
    PRINT ERROR_SEVERITY();
END CATCH

PRINT 'Execution Continues Outside the catch block';

BEGIN TRY
    DROP TABLE dbo.nonExistingTable;
END TRY
BEGIN CATCH
    PRINT 'An error has occurred.'
    PRINT ERROR_NUMBER();
    PRINT ERROR_MESSAGE();
    PRINT ERROR_LINE();
    PRINT ERROR_SEVERITY();
END CATCH;

PRINT 'Execution Continues Outside the catch block';
