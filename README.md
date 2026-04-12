# SQL

**1. Definition**

SQL (Structured Query Language) is a language used to interact with databases. It allows users to store, retrieve, modify, and manage data efficiently.

SQL is mainly used with relational databases, where data is organized into structured tables.

**Think of a database like a digital filing system:**

- Tables → folders
- Rows → individual records
- Columns → details about each record
  
<details>
<summary><strong> View Project Details</strong></summary>
  
# 2. Database & Tables
**What is a Database?**

A database is an organized collection of data stored electronically for easy access, management, and updating.

**What is a Table?**

A table is where data is stored in a database. It is made up of:

**Rows (records):** 

Each row represents a single entry

**Columns (fields):** 

Each column represents a specific attribute of the data

Tables help structure data in a way that makes it easy to query and analyze.

# 3. CRUD Operations

CRUD represents the four basic operations performed on data:

1. Create:
  
Adding new data into the database

2. Read:

Retrieving existing data

3. Update:

Modifying existing data

4. Delete:

Removing data

These operations form the foundation of how applications interact with databases.

# 4. Filtering Data

Filtering allows you to retrieve only the data that meets specific conditions.

This is important when working with large datasets, as it helps focus only on relevant information instead of viewing everything.

# 5. Operators in SQL

Operators are used to define conditions when working with data:

Comparison operators help compare values (e.g., greater than, less than)
Logical operators combine multiple conditions (e.g., AND, OR)
Pattern matching helps search for specific text patterns

These make queries more flexible and powerful.

# 6. Sorting & Limiting Data
Sorting arranges data in a specific order (ascending or descending)
Limiting restricts the number of results returned

These are useful when analyzing or displaying only the most important data.

# 7. Aggregate Functions

Aggregate functions perform calculations on multiple rows of data and return a single result.

Common uses include:

Counting records
Calculating averages
Finding totals
Identifying minimum or maximum values

They are widely used in reporting and data analysis.

# 8. Grouping Data

Grouping organizes data into categories based on shared values.

This is useful for summarizing data, such as:

Counting how many items fall into each category
Comparing performance across groups

Filtering can also be applied after grouping to refine results further.

# 9. Joins in SQL

Joins are used to combine data from multiple tables.

Since relational databases store data in separate tables, joins allow you to:

Link related data
Create more meaningful insights
Avoid data duplication

Different types of joins determine how data is matched between tables.

# 10. Keys & Constraints

Keys and constraints ensure data integrity and consistency:

Primary Key: Uniquely identifies each record in a table
Foreign Key: Connects one table to another
NOT NULL: Ensures a value must be provided
UNIQUE: Prevents duplicate values
DEFAULT: Assigns a value automatically if none is provided

These rules help maintain accurate and reliable data.

# 11. Creating & Managing Tables

Databases allow you to:

Create new tables
Modify existing tables
Delete tables when no longer needed

Proper table design is important for efficient data storage and retrieval.

# 12. Subqueries

A subquery is a query inside another query.

It allows you to:

- Break complex problems into smaller parts
- Perform calculations first before applying conditions
- Make queries more dynamic and flexible

# SQL Key Terms & Definitions
**Basic SQL Components**

## Database
A structured collection of data stored electronically.
Acts as a container that holds multiple related tables.

## Table
A structured set of data organized into rows and columns.
Each table represents a specific subject (e.g., customers, orders).

## Row (Record)
A single entry in a table representing one instance of data.

## Column (Field)
A specific attribute of the data (e.g., name, price, date).

## Operators

Operators are used to perform calculations and apply conditions.

## Arithmetic Operators

Used when working with numbers.

- Addition (+)
- Subtraction (-)
- Multiplication (*)
- Division (/)
- Modulus  (% -returns the remainder after division)

These are useful when calculating totals, averages, profits, or percentages.

## Comparison Operators

Used to compare two values.

- Equal to (=)
- Not equal to (!= or <>)
- Greater than (>)
- Less than (<)
- Greater than or equal to (>=)
- Less than or equal to (<=)

These operators are often used when filtering data, such as finding products with a price greater than a certain amount.

### Logical Operators

**Used to combine multiple conditions:**

- AND → All conditions must be true
- OR → At least one condition must be true
- NOT → Reverses a condition

For example, you may want to find customers who are from one city and have made more than a certain number of purchases.

### Special Operators

- IN
  
Checks whether a value exists in a list.
- BETWEEN
  
Checks whether a value falls within a range.
- LIKE
  
Used for searching text patterns.
It is useful when you do not know the full text and want to search by part of a word or phrase.
- IS NULL
  
Checks whether a value is missing or empty.

## Keys

Keys help identify rows and create relationships between tables.

- Primary Key
  
A unique value that identifies each row in a table.
No two rows can have the same primary key.
- Foreign Key
  
A column that connects one table to another.
It is used to create relationships between tables.
- Composite Key
  
A key made up of two or more columns combined together.
- Unique Key
  
Ensures that all values in a column are different, while still allowing the column to contain a missing value if permitted.Keys ensure uniqueness and define relationships between tables.

- Primary Key → uniquely identifies each row
- Foreign Key → links tables together
- Composite Key → combination of multiple columns
- Unique Key → ensures no duplicate values
  
## Constraints

Constraints are rules applied to columns to keep the data accurate and consistent.

- NOT NULL

  Ensures that a column must always contain a value.

- UNIQUE
  
Prevents duplicate values in a column.

- PRIMARY KEY
  
Combines both uniqueness and the requirement that the value cannot be empty.

- FOREIGN KEY
  
Ensures that the value exists in another related table.

- CHECK
  
Restricts the values allowed in a column.
For example, age cannot be less than zero.

- DEFAULT
  
Automatically assigns a value if none is provided.

## Views
A virtual table created from one or more existing tables.

A view does not store data itself. Instead, it displays data from other tables.

Views are useful because they:
- Simplify complex queries
- Make reports easier to read
- Restrict access to only certain columns or rows

## Indexes

A structure that improves the speed of searching and retrieving data.

An index works like the index at the back of a book. Instead of scanning every row, SQL can quickly find the information it needs.
- Improves reading and searching speed
- May slightly slow down adding or updating data because the index must also be updated

## Joins

Joins combine data from multiple tables.

- INNER JOIN
  
Returns only rows that have matching values in both tables.
- LEFT JOIN
-  
Returns all rows from the left table, even if there is no matching value in the right table.
- RIGHT JOIN
  
Returns all rows from the right table, even if there is no matching value in the left table.
- FULL JOIN
  
Returns all rows from both tables, whether they match or not.

## Aggregate Functions

**Aggregate functions summarize multiple rows into a single result.**

- COUNT
  
Returns the number of rows.
- SUM
  
Returns the total of numeric values.

- AVG
  
Returns the average value.
- MIN
  
Returns the smallest value.

- MAX
Returns the largest value.

These functions are commonly used in reports and dashboards.

## Grouping & Filtering
- GROUP BY
  
Combines rows that have the same value into a single group.

For example, you can group sales by category or by month.

- HAVING
  
Filters grouped results after they have been created.

It works similarly to a normal filter, but it is specifically used after grouping data

## Transaction
A set of SQL operations executed together as one unit.
Either all operations succeed, or none are applied (this ensures data consistency).

- COMMIT

Saves all changes permanently to the database.
Once committed, changes cannot be undone.

- ROLLBACK

Reverses changes made during a transaction.
Useful when an error occurs and you want to restore the previous state.

**Key Idea:**
Transactions help maintain data integrity, especially in cases like financial transactions or bulk updates.

## Other Important Terms
- Query
  
A request to retrieve or modify data in a database.
Every SQL statement you write is essentially a query.

- Schema
  
The overall structure of the database.
Defines how tables, columns, and relationships are organized.

- Stored Procedure
  
Pre-written SQL code stored in the database that can be executed when needed.
Helps improve efficiency and reusability of code.

- Trigger

An automatic action performed when a specific event occurs in the database.
For example, automatically updating a log when new data is inserted.

- Normalization
  
The process of organizing data to reduce redundancy and improve efficiency.
Helps avoid duplicate data and ensures better database design.
</details>
