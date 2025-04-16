# MySQL Data Validation Guide

## Table of Contents
1. [Data Types and Constraints](#data-types-and-constraints)
2. [Field Validation](#field-validation)
3. [Table Constraints](#table-constraints)
4. [Triggers for Validation](#triggers-for-validation)
5. [Stored Procedures for Validation](#stored-procedures-for-validation)
6. [Data Integrity Checks](#data-integrity-checks)
7. [Best Practices](#best-practices)

## Data Types and Constraints

### Numeric Validation
```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    price DECIMAL(10,2) CHECK (price > 0),
    quantity INT UNSIGNED,
    discount_percentage DECIMAL(5,2) CHECK (discount_percentage BETWEEN 0 AND 100)
);
```

### String Validation
```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
    phone VARCHAR(20) CHECK (phone REGEXP '^\\+?[0-9]{10,15}$')
);
```

### Date and Time Validation
```sql
CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(100),
    start_date DATE CHECK (start_date >= CURDATE()),
    end_date DATE CHECK (end_date >= start_date),
    event_time TIME CHECK (event_time BETWEEN '09:00:00' AND '18:00:00')
);
```

### Enum and Set Validation
```sql
CREATE TABLE orders (
    id INT PRIMARY KEY,
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled'),
    payment_method SET('credit_card', 'debit_card', 'paypal', 'bank_transfer'),
    priority ENUM('low', 'medium', 'high') DEFAULT 'medium'
);
```

## Field Validation

### NOT NULL Constraints
```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    hire_date DATE NOT NULL
);
```

### Default Values
```sql
CREATE TABLE tasks (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### Custom Validation Rules
```sql
CREATE TABLE credit_cards (
    id INT PRIMARY KEY,
    card_number VARCHAR(16) CHECK (LENGTH(card_number) = 16),
    expiry_date DATE CHECK (expiry_date > CURDATE()),
    cvv VARCHAR(3) CHECK (LENGTH(cvv) = 3),
    card_type VARCHAR(20) CHECK (card_type IN ('VISA', 'MASTERCARD', 'AMEX'))
);
```

## Table Constraints

### Primary Key Constraints
```sql
CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50),
    PRIMARY KEY (dept_id)
);

-- Composite Primary Key
CREATE TABLE employee_departments (
    employee_id INT,
    department_id INT,
    start_date DATE,
    PRIMARY KEY (employee_id, department_id)
);
```

### Foreign Key Constraints
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
```

### Unique Constraints
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    sku VARCHAR(20) UNIQUE,
    name VARCHAR(100),
    UNIQUE KEY idx_product_name (name)
);
```

## Triggers for Validation

### Before Insert Trigger
```sql
DELIMITER //

CREATE TRIGGER validate_order_amount
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order amount must be greater than 0';
    END IF;
    
    IF NEW.discount > NEW.amount THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Discount cannot be greater than order amount';
    END IF;
END //

DELIMITER ;
```

### Before Update Trigger
```sql
DELIMITER //

CREATE TRIGGER validate_employee_salary
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be decreased';
    END IF;
    
    IF NEW.salary > OLD.salary * 1.5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary increase cannot exceed 50%';
    END IF;
END //

DELIMITER ;
```

### Complex Validation Trigger
```sql
DELIMITER //

CREATE TRIGGER validate_product_inventory
BEFORE INSERT ON product_inventory
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;
    DECLARE min_stock INT;
    
    -- Get current stock
    SELECT quantity INTO current_stock
    FROM products
    WHERE product_id = NEW.product_id;
    
    -- Get minimum stock level
    SELECT min_stock_level INTO min_stock
    FROM products
    WHERE product_id = NEW.product_id;
    
    -- Validate stock level
    IF NEW.quantity < min_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock level below minimum required';
    END IF;
    
    -- Validate stock adjustment
    IF NEW.adjustment_type = 'OUT' AND NEW.quantity > current_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for adjustment';
    END IF;
END //

DELIMITER ;
```

## Stored Procedures for Validation

### Data Validation Procedure
```sql
DELIMITER //

CREATE PROCEDURE validate_customer_data(
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_email VARCHAR(255),
    IN p_phone VARCHAR(20),
    OUT p_is_valid BOOLEAN,
    OUT p_error_message VARCHAR(255)
)
BEGIN
    DECLARE email_pattern VARCHAR(255);
    DECLARE phone_pattern VARCHAR(255);
    
    SET email_pattern = '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';
    SET phone_pattern = '^\\+?[0-9]{10,15}$';
    
    SET p_is_valid = TRUE;
    SET p_error_message = '';
    
    -- Validate first name
    IF p_first_name IS NULL OR p_first_name = '' THEN
        SET p_is_valid = FALSE;
        SET p_error_message = 'First name is required';
    END IF;
    
    -- Validate last name
    IF p_last_name IS NULL OR p_last_name = '' THEN
        SET p_is_valid = FALSE;
        SET p_error_message = CONCAT(p_error_message, ' Last name is required');
    END IF;
    
    -- Validate email
    IF p_email NOT REGEXP email_pattern THEN
        SET p_is_valid = FALSE;
        SET p_error_message = CONCAT(p_error_message, ' Invalid email format');
    END IF;
    
    -- Validate phone
    IF p_phone NOT REGEXP phone_pattern THEN
        SET p_is_valid = FALSE;
        SET p_error_message = CONCAT(p_error_message, ' Invalid phone format');
    END IF;
END //

DELIMITER ;
```

## Data Integrity Checks

### Regular Integrity Checks
```sql
-- Check for orphaned records
SELECT o.order_id
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Check for data consistency
SELECT p.product_id, p.stock_quantity, SUM(oi.quantity) as ordered_quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.stock_quantity
HAVING p.stock_quantity < SUM(oi.quantity);
```

### Scheduled Validation
```sql
-- Create event for daily validation
CREATE EVENT daily_data_validation
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    -- Check for expired records
    DELETE FROM sessions WHERE expiry_date < NOW();
    
    -- Validate and update status
    UPDATE orders 
    SET status = 'expired'
    WHERE status = 'pending' 
    AND created_at < DATE_SUB(NOW(), INTERVAL 30 DAY);
    
    -- Archive old records
    INSERT INTO orders_archive
    SELECT * FROM orders
    WHERE created_at < DATE_SUB(NOW(), INTERVAL 1 YEAR);
    
    DELETE FROM orders
    WHERE created_at < DATE_SUB(NOW(), INTERVAL 1 YEAR);
END;
```

## Best Practices

### 1. Data Type Selection
- Choose appropriate data types for each field
- Use smallest possible data type that can hold the data
- Consider future growth and requirements
- Use ENUM for fixed set of values
- Use appropriate string lengths

### 2. Constraint Implementation
- Implement constraints at database level
- Use appropriate constraint types (NOT NULL, UNIQUE, CHECK)
- Consider foreign key relationships
- Use appropriate ON DELETE and ON UPDATE actions
- Document all constraints

### 3. Validation Rules
- Implement validation at multiple levels
- Use database constraints for basic validation
- Use triggers for complex validation
- Implement application-level validation
- Document all validation rules

### 4. Error Handling
- Provide clear error messages
- Log validation failures
- Implement appropriate error recovery
- Consider transaction management
- Handle edge cases

### 5. Maintenance
- Regularly review validation rules
- Update constraints as requirements change
- Monitor validation performance
- Document changes to validation rules
- Test validation rules regularly

## Resources for Further Learning
- [MySQL Data Types](https://dev.mysql.com/doc/refman/8.0/en/data-types.html)
- [MySQL Constraints](https://dev.mysql.com/doc/refman/8.0/en/constraints.html)
- [MySQL Triggers](https://dev.mysql.com/doc/refman/8.0/en/triggers.html)
- [MySQL Stored Procedures](https://dev.mysql.com/doc/refman/8.0/en/stored-programs-defining.html) 