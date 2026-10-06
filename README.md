We need to store three things, and each gets its own table:

Table	What it stores
Books	Every book in the library
Users	People who borrow books
Transactions	A record each time a book is issued or returned

Relationships (an interview favorite):

One user can borrow many books over time, so Users -> Transactions is one-to-many.
One book can be borrowed many times by different people, so Books -> Transactions is one-to-many.
So Transactions sits in the middle and holds two foreign keys: UserID and BookID.
Users (1) ---< Transactions >--- (1) Books

Simple definitions:

Primary key (PK): a column that uniquely identifies each row (like an Aadhaar number).
Foreign key (FK): a column that points to the primary key of another table. It stops you from entering a transaction for a book that doesn't exist.

Create DB
