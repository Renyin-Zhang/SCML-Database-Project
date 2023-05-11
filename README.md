# Senior Citizens Mobile Library (SCML) Database Project

This project focuses on improving data integrity and usability aspects of the Senior Citizens Mobile Library (SCML) database. SCML is a mobile library service provided by the local council to aged-care residences, lending books to elderly residents. The database currently uses an Excel spreadsheet for managing lending records but is transitioning to an SQLite database to handle the increasing volume of data.

## Project Overview

The project aims to enhance the integrity and consistency of the SCML database by implementing various data integrity features. The existing database schema consists of four tables: BookEdition, BookCopy, loan, and Client. The tables store information about book editions, book copies, lending records, and clients, respectively.

## Tables in the Database

The database has four tables: `BookEdition`, `BookCopy`, `loan`, and `Client`.

### BookEdition

This table stores data about editions of a book (not individual physical copies of a book).

| Column Name     | Type    |
| --------------- | ------- |
| ISBN            | TEXT    |
| title           | TEXT    |
| author          | TEXT    |
| publicationDate | INTEGER |
| genre           | TEXT    |

### BookCopy

This table stores data about the actual physical books in the SCML collection.

| Column Name | Type    |
| ----------- | ------- |
| ISBN        | TEXT    |
| copyNumber  | INTEGER |
| daysLoaned  | INTEGER |

### loan

Each row of the `loan` table stores details for a single loan of a particular physical copy of a book to a particular client.

| Column Name | Type   |
| ----------- | ------ |
| clientId    | INTEGER |
| ISBN        | TEXT   |
| copyNumber  | INTEGER |
| dateOut     | TEXT   |
| dateBack    | TEXT   |

### Client

This table records the details for each SCML client.

| Column Name | Type   |
| ----------- | ------ |
| clientId    | INTEGER |
| name        | TEXT   |
| residence   | TEXT   |

## Project Tasks

### Task (a): Primary Key Constraints

To ensure data integrity, primary key constraints need to be added to the `BookEdition`, `BookCopy`, and `Client` tables. Currently, there is no mechanism to prevent duplicate entries with the same identifier. By adding primary key constraints, SQLite will enforce uniqueness on these tables.

### Task (b): Referential Integrity

To address the issue of mistyped numbers during data entry, referential integrity constraints should be implemented in the `loan` table. These constraints will ensure that each loan record refers to valid clients and actual books. Furthermore, SCML wants the ability to change a client's ID and reflect that change automatically in the `loan` table. If a client is deleted, the loans associated with that client should remain in the table with the client ID set to NULL.

### Task (c): Data Entry Validation

ISBN validation is crucial to ensure accurate data entry. A check digit calculation is required to validate the ISBN. This project assumes 5-digit ISBNs for simplicity, and assume that the check digit of the ISBN is obtained by taking the final digit of the value: 

_3×(d<sub>1</sub> +d<sub>3</sub>)+7×(d<sub>2</sub> +d<sub>4</sub>)_

A constraint should be added to the `BookEdition` table to prevent the insertion of rows with invalid ISBNs.

### Task (d): Trigger for Data Consistency

When a book is returned, the `loan` table's corresponding row is updated to include the return date. However, often the calculation of the number of days the book was on loan is omitted or done incorrectly. To address this, a trigger should be created on the `loan` table. This trigger will automatically calculate the number of days from the loan and update the `daysLoaned` column in the corresponding `BookCopy` row.

### Task (e): View Creation

A view called `ReadingHistory` needs to be created to provide a consolidated view of lending history. The view should include information about each client, year, genre, and the number of loans of books in that genre made to the client in a specific year. The `dateOut` column will determine the year to which a loan belongs.
