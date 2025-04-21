USE sakila;
GO

BEGIN TRY
    BEGIN TRAN

        --customer_id is a primary Key with Identity so it cannot be set in an update
        UPDATE dbo.customer
        SET customer_id = 2 
        WHERE customer_id = 1;

    COMMIT
END TRY

BEGIN CATCH

    PRINT ERROR_MESSAGE();

    PRINT 'Rolling back transaction';
    IF @@TRANCOUNT > 0 BEGIN
        ROLLBACK;
    END;
END CATCH;
