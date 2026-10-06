USE LibraryDB;
GO

CREATE PROCEDURE ReturnBook
    @TransactionID INT
AS
BEGIN
    -- Make sure the book is actually still issued
    IF NOT EXISTS (SELECT 1 FROM Transactions
                   WHERE TransactionID = @TransactionID AND Status = 'Issued')
    BEGIN
        PRINT 'Invalid transaction or book already returned.';
        RETURN;
    END

    DECLARE @BookID INT;
    SELECT @BookID = BookID FROM Transactions WHERE TransactionID = @TransactionID;

    BEGIN TRANSACTION;

    UPDATE Transactions
    SET ReturnDate = GETDATE(), Status = 'Returned'
    WHERE TransactionID = @TransactionID;

    UPDATE Books
    SET AvailableCopies = AvailableCopies + 1
    WHERE BookID = @BookID;

    COMMIT TRANSACTION;
    PRINT 'Book returned successfully.';
END;
GO
/*Testing*/
--EXEC ReturnBook @TransactionID = 1;