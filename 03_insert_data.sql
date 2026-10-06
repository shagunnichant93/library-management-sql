USE LibraryDB;
GO

INSERT INTO Books (Title, Author, ISBN, Category, TotalCopies, AvailableCopies)
VALUES
('Clean Code', 'Robert Martin', '9780132350884', 'Programming', 3, 3),
('The Alchemist', 'Paulo Coelho', '9780061122415', 'Fiction', 2, 2),
('Wings of Fire', 'A.P.J. Abdul Kalam', '9788173711466', 'Biography', 2, 2),
('Database System Concepts', 'Silberschatz', '9780078022159', 'Education', 1, 1);

INSERT INTO Users (FullName, Email, Phone)
VALUES
('Rahul Sharma', 'rahul@example.com', '9876543210'),
('Priya Singh', 'priya@example.com', '9123456780'),
('Amit Verma', 'amit@example.com', '9988776655');
GO

/*Check data*/
SELECT * FROM Books;
SELECT * FROM Users;