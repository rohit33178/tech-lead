# Advanced MySQL Topics

## Table of Contents
1. [Performance Optimization](#performance-optimization)
2. [Advanced Query Techniques](#advanced-query-techniques)
3. [Stored Procedures and Functions](#stored-procedures-and-functions)
4. [Triggers and Events](#triggers-and-events)
5. [Partitioning](#partitioning)
6. [Replication](#replication)
7. [High Availability](#high-availability)
8. [Security](#security)
9. [Monitoring and Maintenance](#monitoring-and-maintenance)
10. [Enterprise Features](#enterprise-features)

## Performance Optimization

### Query Optimization
```sql
-- Use EXPLAIN to analyze query execution plan
EXPLAIN SELECT * FROM users WHERE username = 'john_doe';

-- Force index usage
SELECT * FROM users FORCE INDEX (idx_username) WHERE username = 'john_doe';

-- Use query hints
SELECT /*+ INDEX(users idx_username) */ * FROM users WHERE username = 'john_doe';
```

### Index Optimization
```sql
-- Create composite indexes
CREATE INDEX idx_name_age ON users(last_name, first_name, age);

-- Create covering index
CREATE INDEX idx_covering ON orders(user_id, order_date, amount);

-- Use index hints
SELECT * FROM users USE INDEX (idx_username) WHERE username = 'john_doe';
```

### Configuration Optimization
```ini
# Important my.cnf settings
innodb_buffer_pool_size = 4G
innodb_log_file_size = 256M
innodb_flush_log_at_trx_commit = 2
innodb_flush_method = O_DIRECT
query_cache_size = 0
```

## Advanced Query Techniques

### Common Table Expressions (CTEs)
```sql
WITH RECURSIVE cte AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM cte WHERE n < 10
)
SELECT * FROM cte;
```

### Window Functions
```sql
SELECT 
    user_id,
    order_date,
    amount,
    SUM(amount) OVER (PARTITION BY user_id ORDER BY order_date) AS running_total,
    RANK() OVER (PARTITION BY user_id ORDER BY amount DESC) AS rank
FROM orders;
```

### Advanced Joins
```sql
-- Natural Join
SELECT * FROM users NATURAL JOIN orders;

-- Cross Join
SELECT * FROM users CROSS JOIN products;

-- Self Join
SELECT a.username, b.username AS referred_by
FROM users a
LEFT JOIN users b ON a.referred_by = b.id;
```

## Stored Procedures and Functions

### Stored Procedures
```sql
DELIMITER //

CREATE PROCEDURE process_order(IN order_id INT, OUT status VARCHAR(50))
BEGIN
    DECLARE order_amount DECIMAL(10,2);
    DECLARE user_balance DECIMAL(10,2);
    
    -- Get order amount
    SELECT amount INTO order_amount FROM orders WHERE id = order_id;
    
    -- Get user balance
    SELECT balance INTO user_balance FROM users 
    WHERE id = (SELECT user_id FROM orders WHERE id = order_id);
    
    -- Process order
    IF user_balance >= order_amount THEN
        UPDATE users SET balance = balance - order_amount 
        WHERE id = (SELECT user_id FROM orders WHERE id = order_id);
        SET status = 'SUCCESS';
    ELSE
        SET status = 'INSUFFICIENT_FUNDS';
    END IF;
END //

DELIMITER ;
```

### User-Defined Functions
```sql
DELIMITER //

CREATE FUNCTION calculate_discount(amount DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(10,2);
    
    IF amount > 1000 THEN
        SET discount = amount * 0.1;
    ELSEIF amount > 500 THEN
        SET discount = amount * 0.05;
    ELSE
        SET discount = 0;
    END IF;
    
    RETURN discount;
END //

DELIMITER ;
```

## Triggers and Events

### Triggers
```sql
DELIMITER //

CREATE TRIGGER before_order_insert
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order amount must be greater than 0';
    END IF;
END //

DELIMITER ;
```

### Events
```sql
CREATE EVENT cleanup_old_orders
ON SCHEDULE EVERY 1 DAY
DO
    DELETE FROM orders 
    WHERE order_date < DATE_SUB(NOW(), INTERVAL 1 YEAR);
```

## Partitioning

### Range Partitioning
```sql
CREATE TABLE orders (
    id INT,
    order_date DATE,
    amount DECIMAL(10,2)
) PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p0 VALUES LESS THAN (2020),
    PARTITION p1 VALUES LESS THAN (2021),
    PARTITION p2 VALUES LESS THAN (2022),
    PARTITION p3 VALUES LESS THAN (2023),
    PARTITION p4 VALUES LESS THAN MAXVALUE
);
```

### Hash Partitioning
```sql
CREATE TABLE users (
    id INT,
    username VARCHAR(50)
) PARTITION BY HASH(id)
PARTITIONS 4;
```

## Replication

### Master-Slave Replication
```sql
-- On Master
CHANGE MASTER TO
    MASTER_HOST='slave_host',
    MASTER_USER='replication_user',
    MASTER_PASSWORD='password',
    MASTER_LOG_FILE='mysql-bin.000001',
    MASTER_LOG_POS=107;

-- On Slave
START SLAVE;
```

### Group Replication
```sql
-- Configure group replication
SET GLOBAL group_replication_bootstrap_group=ON;
START GROUP_REPLICATION;
SET GLOBAL group_replication_bootstrap_group=OFF;
```

## High Availability

### MySQL InnoDB Cluster
```sql
-- Configure cluster
dba.configureInstance('admin@localhost:3306')
dba.createCluster('myCluster')
```

### Load Balancing
```sql
-- Configure read/write splitting
INSERT INTO mysql_servers(hostgroup_id,hostname,port) VALUES (10,'master',3306);
INSERT INTO mysql_servers(hostgroup_id,hostname,port) VALUES (20,'slave1',3306);
INSERT INTO mysql_servers(hostgroup_id,hostname,port) VALUES (20,'slave2',3306);
```

## Security

### Encryption
```sql
-- Enable encryption
ALTER TABLE users ENCRYPTION='Y';

-- Create encrypted column
CREATE TABLE sensitive_data (
    id INT,
    data VARBINARY(255) ENCRYPTED
);
```

### Audit Logging
```sql
-- Enable audit plugin
INSTALL PLUGIN audit_log SONAME 'audit_log.so';
SET GLOBAL audit_log_policy=ALL;
```

## Monitoring and Maintenance

### Performance Schema
```sql
-- Enable performance schema
UPDATE performance_schema.setup_instruments
SET ENABLED = 'YES', TIMED = 'YES'
WHERE NAME LIKE '%statement/%';

-- Query performance metrics
SELECT * FROM performance_schema.events_statements_summary_by_digest
ORDER BY SUM_TIMER_WAIT DESC LIMIT 10;
```

### Maintenance Commands
```sql
-- Analyze table
ANALYZE TABLE users;

-- Optimize table
OPTIMIZE TABLE orders;

-- Check table
CHECK TABLE users FAST;
```

## Enterprise Features

### MySQL Enterprise Backup
```bash
# Backup command
mysqlbackup --backup-dir=/backup --user=root --password backup
```

### MySQL Enterprise Monitor
```sql
-- Configure monitoring
CALL mysql.install_enterprise_monitor();
```

### MySQL Enterprise Security
```sql
-- Enable enterprise security
INSTALL PLUGIN validate_password SONAME 'validate_password.so';
SET GLOBAL validate_password_policy=LOW;
```

## Best Practices for Advanced Usage

1. **Performance Tuning**
   - Regularly analyze and optimize queries
   - Use appropriate indexing strategies
   - Monitor and adjust buffer pool size
   - Implement query caching when appropriate

2. **High Availability**
   - Implement proper replication strategies
   - Use connection pooling
   - Configure automatic failover
   - Regular backup and recovery testing

3. **Security**
   - Implement encryption at rest and in transit
   - Use strong authentication methods
   - Regular security audits
   - Implement proper access controls

4. **Monitoring**
   - Set up comprehensive monitoring
   - Configure alerts for critical metrics
   - Regular performance analysis
   - Capacity planning

5. **Maintenance**
   - Regular backup schedules
   - Database optimization
   - Index maintenance
   - Statistics updates

## Resources for Further Learning
- [MySQL Enterprise Documentation](https://dev.mysql.com/doc/enterprise/en/)
- [MySQL Performance Blog](https://www.percona.com/blog/)
- [MySQL High Availability Guide](https://dev.mysql.com/doc/refman/8.0/en/ha-overview.html)
- [MySQL Security Guide](https://dev.mysql.com/doc/refman/8.0/en/security.html) 