# MySQL Learning Guide

## Table of Contents
1. [Introduction](#introduction)
2. [Basic Concepts](#basic-concepts)
3. [Data Types](#data-types)
4. [SQL Commands](#sql-commands)
5. [Database Operations](#database-operations)
6. [Table Operations](#table-operations)
7. [Data Manipulation](#data-manipulation)
8. [Joins](#joins)
9. [Indexes](#indexes)
10. [Transactions](#transactions)
11. [Best Practices](#best-practices)

## Introduction
MySQL is an open-source relational database management system (RDBMS) that uses Structured Query Language (SQL) to manage and manipulate data. It's widely used for web applications and is known for its reliability, scalability, and performance.

## Basic Concepts
- **Database**: A collection of related data
- **Table**: A structured collection of data organized in rows and columns
- **Row**: A single record in a table
- **Column**: A field in a table
- **Primary Key**: A unique identifier for each row in a table
- **Foreign Key**: A field that links to the primary key of another table

## Data Types
### Numeric Types
- INT: Integer values
- DECIMAL: Fixed-point numbers
- FLOAT: Single-precision floating-point
- DOUBLE: Double-precision floating-point

### String Types
- CHAR: Fixed-length strings
- VARCHAR: Variable-length strings
- TEXT: Large text data
- ENUM: String with predefined values

### Date and Time Types
- DATE: Date values
- TIME: Time values
- DATETIME: Date and time values
- TIMESTAMP: Timestamp values

## SQL Commands
### DDL (Data Definition Language)
```sql
CREATE DATABASE database_name;
CREATE TABLE table_name (column1 datatype, column2 datatype, ...);
ALTER TABLE table_name ADD column_name datatype;
DROP TABLE table_name;
```

### DML (Data Manipulation Language)
```sql
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
UPDATE table_name SET column1 = value1 WHERE condition;
DELETE FROM table_name WHERE condition;
SELECT column1, column2 FROM table_name WHERE condition;
```

### DCL (Data Control Language)
```sql
GRANT privileges ON database.table TO 'username'@'host';
REVOKE privileges ON database.table FROM 'username'@'host';
```

## Database Operations
```sql
-- Create a database
CREATE DATABASE my_database;

-- Use a database
USE my_database;

-- Show all databases
SHOW DATABASES;

-- Drop a database
DROP DATABASE my_database;
```

## Table Operations
```sql
-- Create a table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Show table structure
DESCRIBE users;

-- Add a column
ALTER TABLE users ADD COLUMN age INT;

-- Modify a column
ALTER TABLE users MODIFY COLUMN email VARCHAR(150);

-- Drop a column
ALTER TABLE users DROP COLUMN age;
```

## Data Manipulation
```sql
-- Insert data
INSERT INTO users (username, email) VALUES ('john_doe', 'john@example.com');

-- Update data
UPDATE users SET email = 'new@example.com' WHERE username = 'john_doe';

-- Delete data
DELETE FROM users WHERE username = 'john_doe';

-- Select data
SELECT * FROM users;
SELECT username, email FROM users WHERE id > 5;
```

## Joins
```sql
-- Inner Join
SELECT users.username, orders.order_date
FROM users
INNER JOIN orders ON users.id = orders.user_id;

-- Left Join
SELECT users.username, orders.order_date
FROM users
LEFT JOIN orders ON users.id = orders.user_id;

-- Right Join
SELECT users.username, orders.order_date
FROM users
RIGHT JOIN orders ON users.id = orders.user_id;
```

## Indexes
```sql
-- Create an index
CREATE INDEX idx_username ON users(username);

-- Create a unique index
CREATE UNIQUE INDEX idx_email ON users(email);

-- Drop an index
DROP INDEX idx_username ON users;
```

## Transactions
```sql
-- Start a transaction
START TRANSACTION;

-- Perform operations
INSERT INTO orders (user_id, amount) VALUES (1, 100);
UPDATE users SET balance = balance - 100 WHERE id = 1;

-- Commit the transaction
COMMIT;

-- Rollback the transaction
ROLLBACK;
```

## Best Practices
1. **Naming Conventions**
   - Use lowercase for table and column names
   - Use underscores for spaces
   - Be descriptive but concise

2. **Indexing**
   - Index frequently queried columns
   - Don't over-index as it slows down writes
   - Use composite indexes for multiple column queries

3. **Query Optimization**
   - Use EXPLAIN to analyze query performance
   - Avoid SELECT * when possible
   - Use appropriate data types
   - Normalize your database design

4. **Security**
   - Use parameterized queries to prevent SQL injection
   - Implement proper access controls
   - Regularly backup your database
   - Use strong passwords

5. **Maintenance**
   - Regularly optimize tables
   - Monitor query performance
   - Keep statistics up to date
   - Implement proper backup strategies

## Common Performance Issues and Solutions
1. **Slow Queries**
   - Add appropriate indexes
   - Optimize query structure
   - Use query caching
   - Consider denormalization for frequently accessed data

2. **High CPU Usage**
   - Optimize complex queries
   - Implement proper indexing
   - Consider read replicas for heavy read operations

3. **Memory Issues**
   - Configure appropriate buffer sizes
   - Monitor and optimize connection pool
   - Implement proper caching strategies

## Resources for Further Learning
- [MySQL Official Documentation](https://dev.mysql.com/doc/)
- [MySQL Performance Blog](https://www.percona.com/blog/)
- [MySQL Tutorial](https://www.mysqltutorial.org/)
- [MySQL Workbench](https://www.mysql.com/products/workbench/) 