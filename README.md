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

# Data Types in SQL

**What Are Data Types?**

Data types define the kind of data that can be stored in a column.

Choosing the correct data type is important because it:

- Improves performance
- Saves storage space
- Ensures data accuracy
- Prevents errors during data entry and analysis
  
## 1. Numeric Data Types

Used for storing numbers.

1. **INT**
   
Stores whole numbers within a standard range.

Commonly used for IDs, counts, and quantities.

2. **BIGINT**
   
Stores very large whole numbers.

Used in large-scale systems (e.g., millions of records).

3. **SMALLINT**
   
Stores smaller integers.

More storage-efficient when large values are unnecessary.

4. **DECIMAL / NUMERIC (precision, scale)**
   
Stores exact numbers with fixed decimal places.

Best for financial data where accuracy is critical (e.g., prices, salaries).

**Example idea:**

Precision = total digits, Scale = digits after decimal.

5. **FLOAT / REAL**
 
Stores approximate decimal values.

Used in scientific or statistical calculations where slight rounding is acceptable.


## 2. Character / String Data Types

Used for storing text.

1. **CHAR(n)**
   
Fixed-length string.

Always uses the same space, even if the text is shorter.

Best for consistent values (e.g., country codes).

3. **VARCHAR(n)**
   
Variable-length string.

Stores only the actual text length and is most commonly used for names, emails, etc.

4. **VARCHAR(MAX)**
   
Stores very large text (up to ~2GB).

Useful for long descriptions, comments, or logs.

5. **TEXT**
   
Legacy data type for large text.

Avoid in modern system, use VARCHAR(MAX) instead.

**Best Practice:**

Use VARCHAR instead of CHAR unless the length is always fixed.

## 3.Date and Time Data Types

Used for storing time-related data.

1. **DATE**
   
Stores only the date (year, month, day).

Useful for birthdays, order dates, and any data where time is not required.

3. **TIME**
   
Stores only time (hours, minutes, seconds).

Useful for scheduling, time tracking, or recording specific times of events.

4. **DATETIME**
   
Stores both date and time.

Widely used in many systems but has lower precision compared to newer types.

5. **DATETIME2**
   
More accurate and flexible than DATETIME, with a wider range and higher precision.

Recommended for modern systems and applications that require detailed timestamps.

6. **SMALLDATETIME**
   
Stores date and time but with less precision (rounded to the nearest minute).

Uses less storage, making it useful when high precision is not necessary

**Best Practice:**
Use DATETIME2 instead of DATETIME for better precision and range.

## 4. Binary Data Types

Used for storing non-text data such as files, images, or encoded data.

1. **BINARY(n)**

Stores fixed-length binary data.

Always uses the specified amount of storage, even if the data is smaller.

2. **VARBINARY(n)**
   
Stores variable-length binary data up to a defined limit.

Uses only the space required, making it more storage-efficient than BINARY.

4. **VARBINARY(MAX)**
   
Stores very large binary data (up to ~2GB), such as images, videos, or documents (e.g., PDFs).

**Note:**
Storing large files in databases can affect performance sometimes better stored externally.

## 5. Other Important Data Types
1. BIT

Stores boolean-like values:

1 → True

0 → False

Also allows NULL (unknown or not specified).

Commonly used for status flags (e.g., active/inactive), yes/no fields, or binary conditions.

2. UNIQUEIDENTIFIER

Stores globally unique IDs (GUIDs).

Each value is automatically unique across systems, making it very reliable.

Useful in distributed systems, APIs, or when merging data from multiple databases where duplicate IDs must be avoided.

3. SQL_VARIANT

Can store multiple data types in one column.

Allows flexibility when the data type may vary (e.g., storing numbers, text, or dates in the same column).

Rarely used due to complexity, difficulty in querying, and performance considerations.

4. XML

Stores structured XML data.

Supports hierarchical and nested data formats.

Useful for storing and exchanging structured data between systems, especially in enterprise applications.

5. JSON (via NVARCHAR)

SQL Server stores JSON as text but provides functions to work with it.

Allows storage of semi-structured data (key-value pairs).

Useful for APIs, web applications, and flexible data structures where the schema may change.

### Data Type Selection Tips (Very Important)

Always choose the smallest suitable data type

- Saves storage space
- Improves query performance
- Reduces memory usage
- Enhances overall database efficiency

Choosing the right data type also helps prevent errors and ensures your data remains accurate and consistent.

### Use:

- INT instead of BIGINT (if possible)
- VARCHAR instead of CHAR (for variable text)
- DECIMAL instead of FLOAT (for money)

**Real-World Example (Conceptual Table)**

A typical dataset might include:

- StudentID → INT
- Name → VARCHAR
- Age → INT
- GPA → DECIMAL
- DateOfBirth → DATE
- IsActive → BIT

**This mix allows efficient storage and accurate analysis.**
</details>
