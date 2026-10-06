# Library Management System (SQL Server)

A beginner-friendly relational database project that manages **books**, **users**, and **transactions**. It includes stored procedures for issuing and returning books, plus queries for tracking them.

## Tech Used

- Microsoft SQL Server (Express or Developer edition)
- SQL Server Management Studio (SSMS)
- Git and GitHub

## Database Design

Three tables, connected with foreign keys:

| Table | Purpose |
|---|---|
| `Books` | Stores every book, with total and available copies |
| `Users` | Stores people who borrow books |
| `Transactions` | Records each issue and return (links a user to a book) |

### Relationships

```
Users (1) ────< Transactions >──── (1) Books
```

- One user can have many transactions.
- One book can appear in many transactions.
- `Transactions` holds two foreign keys: `UserID` and `BookID`.

## Project Structure

```
library-management-sql/
├── 01_create_database.sql
├── 02_create_tables.sql
├── 03_insert_data.sql
├── 04_issue_book.sql
├── 05_return_book.sql
├── 06_tracking_queries.sql
└── README.md
```

## How to Run

Open each file in SSMS and run them **in this order**:

1. `01_create_database.sql` creates the `LibraryDB` database.
2. `02_create_tables.sql` creates the Books, Users and Transactions tables.
3. `03_insert_data.sql` adds sample books and users.
4. `04_issue_book.sql` creates the `IssueBook` stored procedure.
5. `05_return_book.sql` creates the `ReturnBook` stored procedure.
6. `06_tracking_queries.sql` contains queries to track books.

## Usage Examples

**Issue a book** (BookID 1 to UserID 1, for 14 days by default):

```sql
EXEC IssueBook @BookID = 1, @UserID = 1;
```

**Return a book** (using the TransactionID):

```sql
EXEC ReturnBook @TransactionID = 1;
```

**See currently issued books:**

```sql
SELECT t.TransactionID, b.Title, u.FullName, t.IssueDate, t.DueDate
FROM Transactions t
JOIN Books b ON t.BookID = b.BookID
JOIN Users u ON t.UserID = u.UserID
WHERE t.Status = 'Issued';
```

## Features

- Primary keys, foreign keys, `UNIQUE`, `CHECK` and `DEFAULT` constraints
- Issue and return handled with SQL transactions (all-or-nothing)
- Stops issuing when no copies are available
- Tracking queries: currently issued, overdue, user history, availability, most borrowed

## Concepts Practiced

- Normalization and table relationships (one-to-many)
- INNER JOIN, GROUP BY, ORDER BY
- Stored procedures
- Transactions and ACID properties
- Constraints and data integrity

## Future Improvements

- Add a `Fines` table for late returns
- Add a `Staff` table to record who issued each book
- Add a view for overdue books

## Author

Shagun Nichant  
GitHub: (https://github.com/shagunnichant93/library-management-sql.git)