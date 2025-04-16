# MySQL Language Types Guide

## Table of Contents
1. [Data Definition Language (DDL)](#data-definition-language-ddl)
2. [Data Manipulation Language (DML)](#data-manipulation-language-dml)
3. [Data Control Language (DCL)](#data-control-language-dcl)
4. [Transaction Control Language (TCL)](#transaction-control-language-tcl)
5. [Data Query Language (DQL)](#data-query-language-dql)
6. [Best Practices](#best-practices)

## Data Definition Language (DDL)

### CREATE Statements
```sql
-- Create Database
CREATE DATABASE company_db;

-- Create Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(dept_id)
);

-- Create Index
CREATE INDEX idx_employee_name ON employees(first_name, last_name);

-- Create View
CREATE VIEW employee_details AS
SELECT e.emp_id, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN departments d ON e.department_id = d.dept_id;

-- Create Stored Procedure
DELIMITER //

CREATE PROCEDURE get_employee_salary(IN emp_id INT)
BEGIN
    SELECT first_name, last_name, salary
    FROM employees
    WHERE emp_id = emp_id;
END //

DELIMITER ;
```

### ALTER Statements
```sql
-- Add Column
ALTER TABLE employees ADD COLUMN phone VARCHAR(20);

-- Modify Column
ALTER TABLE employees MODIFY COLUMN salary DECIMAL(12,2);

-- Drop Column
ALTER TABLE employees DROP COLUMN phone;

-- Add Constraint
ALTER TABLE employees ADD CONSTRAINT fk_dept 
FOREIGN KEY (department_id) REFERENCES departments(dept_id);

-- Rename Table
ALTER TABLE employees RENAME TO staff;
```

### DROP Statements
```sql
-- Drop Table
DROP TABLE employees;

-- Drop Database
DROP DATABASE company_db;

-- Drop Index
DROP INDEX idx_employee_name ON employees;

-- Drop View
DROP VIEW employee_details;

-- Drop Procedure
DROP PROCEDURE get_employee_salary;
```

### TRUNCATE Statement
```sql
-- Truncate Table
TRUNCATE TABLE employees;
```

## Data Manipulation Language (DML)

### INSERT Statements
```sql
-- Single Row Insert
INSERT INTO employees (emp_id, first_name, last_name, email)
VALUES (1, 'John', 'Doe', 'john.doe@example.com');

-- Multiple Rows Insert
INSERT INTO employees (emp_id, first_name, last_name, email)
VALUES 
    (2, 'Jane', 'Smith', 'jane.smith@example.com'),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com');

-- Insert from Select
INSERT INTO employee_archive
SELECT * FROM employees
WHERE hire_date < '2020-01-01';
```

### UPDATE Statements
```sql
-- Update Single Row
UPDATE employees
SET salary = 50000
WHERE emp_id = 1;

-- Update Multiple Rows
UPDATE employees
SET salary = salary * 1.1
WHERE department_id = 2;

-- Update with Join
UPDATE employees e
JOIN departments d ON e.department_id = d.dept_id
SET e.salary = e.salary * 1.05
WHERE d.dept_name = 'Engineering';
```

### DELETE Statements
```sql
-- Delete Single Row
DELETE FROM employees
WHERE emp_id = 1;

-- Delete Multiple Rows
DELETE FROM employees
WHERE department_id = 3;

-- Delete with Join
DELETE e FROM employees e
JOIN departments d ON e.department_id = d.dept_id
WHERE d.dept_name = 'HR';
```

## Data Control Language (DCL)

### GRANT Statements
```sql
-- Grant Specific Privileges
GRANT SELECT, INSERT ON company_db.employees TO 'user1'@'localhost';

-- Grant All Privileges
GRANT ALL PRIVILEGES ON company_db.* TO 'admin'@'localhost';

-- Grant with Option
GRANT SELECT ON company_db.employees TO 'user2'@'localhost' WITH GRANT OPTION;

-- Grant Role
GRANT 'developer' TO 'user3'@'localhost';
```

### REVOKE Statements
```sql
-- Revoke Specific Privileges
REVOKE INSERT ON company_db.employees FROM 'user1'@'localhost';

-- Revoke All Privileges
REVOKE ALL PRIVILEGES ON company_db.* FROM 'admin'@'localhost';

-- Revoke Role
REVOKE 'developer' FROM 'user3'@'localhost';
```

## Transaction Control Language (TCL)

### COMMIT Statement
```sql
-- Explicit Commit
START TRANSACTION;
INSERT INTO employees (emp_id, first_name, last_name)
VALUES (4, 'Alice', 'Brown');
COMMIT;

-- Implicit Commit
SET autocommit = 1;
```

### ROLLBACK Statement
```sql
-- Rollback Transaction
START TRANSACTION;
UPDATE employees SET salary = 60000 WHERE emp_id = 1;
-- Something went wrong
ROLLBACK;

-- Rollback to Savepoint
START TRANSACTION;
SAVEPOINT sp1;
UPDATE employees SET salary = 55000 WHERE emp_id = 2;
-- Need to undo last update
ROLLBACK TO sp1;
COMMIT;
```

### SAVEPOINT Statement
```sql
START TRANSACTION;
SAVEPOINT sp1;
INSERT INTO employees (emp_id, first_name) VALUES (5, 'Charlie');
SAVEPOINT sp2;
UPDATE employees SET salary = 70000 WHERE emp_id = 3;
-- Can rollback to either sp1 or sp2
```

## Data Query Language (DQL)

### SELECT Statements
```sql
-- Basic Select
SELECT * FROM employees;

-- Select with Conditions
SELECT first_name, last_name, salary
FROM employees
WHERE department_id = 2
AND salary > 50000;

-- Select with Joins
SELECT e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN departments d ON e.department_id = d.dept_id;

-- Select with Group By
SELECT department_id, COUNT(*) as employee_count, AVG(salary) as avg_salary
FROM employees
GROUP BY department_id;

-- Select with Having
SELECT department_id, AVG(salary) as avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 60000;
```

### Subqueries
```sql
-- Single Row Subquery
SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Multiple Row Subquery
SELECT first_name, last_name
FROM employees
WHERE department_id IN (SELECT dept_id FROM departments WHERE location = 'New York');

-- Correlated Subquery
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);
```

## Best Practices

### DDL Best Practices
1. **Database Design**
   - Use appropriate data types
   - Define primary and foreign keys
   - Create necessary indexes
   - Use constraints for data integrity

2. **Naming Conventions**
   - Use consistent naming
   - Use descriptive names
   - Follow company standards
   - Avoid reserved words

3. **Security**
   - Grant minimum required privileges
   - Use roles for privilege management
   - Document schema changes
   - Backup before major changes

### DML Best Practices
1. **Data Modification**
   - Use transactions for multiple operations
   - Validate data before insertion
   - Use prepared statements
   - Handle errors appropriately

2. **Performance**
   - Use appropriate indexes
   - Limit the number of rows affected
   - Use batch operations when possible
   - Monitor query performance

3. **Data Integrity**
   - Maintain referential integrity
   - Use constraints
   - Validate data
   - Handle null values properly

### DCL Best Practices
1. **Security**
   - Follow principle of least privilege
   - Use roles for privilege management
   - Regularly review privileges
   - Document access controls

2. **User Management**
   - Create specific users for applications
   - Use strong passwords
   - Limit remote access
   - Monitor user activity

### TCL Best Practices
1. **Transaction Management**
   - Keep transactions short
   - Handle errors properly
   - Use appropriate isolation levels
   - Monitor deadlocks

2. **Error Handling**
   - Use savepoints when needed
   - Implement proper rollback
   - Log transaction errors
   - Monitor transaction performance

## Resources for Further Learning
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL Language Reference](https://dev.mysql.com/doc/refman/8.0/en/sql-statements.html)
- [MySQL Security Guide](https://dev.mysql.com/doc/refman/8.0/en/security.html)
- [MySQL Performance Tuning](https://dev.mysql.com/doc/refman/8.0/en/optimization.html) 