USE LibraryDB;
GO

CREATE PROCEDURE IssueBook
    @BookID INT,
    @UserID INT,
    @DaysAllowed INT = 14
AS
BEGIN
    -- Check if a copy is available
    IF (SELECT AvailableCopies FROM Books WHERE BookID = @BookID) <= 0
    BEGIN
        PRINT 'Sorry, no copies available.';
        RETURN;
    END

    BEGIN TRANSACTION;

    INSERT INTO Transactions (BookID, UserID, IssueDate, DueDate)
    VALUES (@BookID, @UserID, GETDATE(), DATEADD(DAY, @DaysAllowed, GETDATE()));

    UPDATE Books
    SET AvailableCopies = AvailableCopies - 1
    WHERE BookID = @BookID;

    COMMIT TRANSACTION;
    PRINT 'Book issued successfully.';
END;
GO

/*Testing*/
--EXEC IssueBook @BookID = 1, @UserID = 1;
--EXEC IssueBook @BookID = 2, @UserID = 2;