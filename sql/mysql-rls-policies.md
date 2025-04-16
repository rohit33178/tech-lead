# MySQL Row-Level Security (RLS) and Policies Guide

## Table of Contents
1. [Introduction to RLS](#introduction-to-rls)
2. [Policy Types](#policy-types)
3. [Policy Implementation](#policy-implementation)
4. [Policy Management](#policy-management)
5. [Advanced Policy Features](#advanced-policy-features)
6. [Best Practices](#best-practices)

## Introduction to RLS

### What is Row-Level Security?
Row-Level Security (RLS) is a security feature that allows you to control access to rows in a database table based on the characteristics of the user executing a query. It provides fine-grained access control at the row level.

### Why Use RLS?
- Implement data isolation
- Enforce multi-tenancy
- Control data access based on user roles
- Simplify application security
- Reduce application complexity

## Policy Types

### Basic Row-Level Policies
```sql
-- Create a basic policy
CREATE POLICY employee_policy ON employees
    USING (department_id = current_department_id());

-- Create a policy with check constraint
CREATE POLICY salary_policy ON employees
    USING (salary <= 100000)
    WITH CHECK (salary <= 100000);
```

### Role-Based Policies
```sql
-- Policy for managers
CREATE POLICY manager_policy ON employees
    USING (EXISTS (
        SELECT 1 FROM departments
        WHERE dept_id = department_id
        AND manager_id = current_user_id()
    ));

-- Policy for HR
CREATE POLICY hr_policy ON employees
    USING (current_user_role() = 'HR');
```

### Time-Based Policies
```sql
-- Policy for time-based access
CREATE POLICY time_based_policy ON sensitive_data
    USING (
        (CURRENT_TIME BETWEEN '09:00:00' AND '17:00:00')
        AND (CURRENT_USER() IN ('admin', 'manager'))
    );
```

### Location-Based Policies
```sql
-- Policy for location-based access
CREATE POLICY location_policy ON customer_data
    USING (
        customer_location = current_user_location()
        OR current_user_role() = 'admin'
    );
```

## Policy Implementation

### Basic Implementation
```sql
-- Enable RLS on a table
ALTER TABLE employees ENABLE ROW LEVEL SECURITY;

-- Create a simple policy
CREATE POLICY employee_view_policy ON employees
    FOR SELECT
    USING (department_id = current_department_id());

-- Create a policy for insert
CREATE POLICY employee_insert_policy ON employees
    FOR INSERT
    WITH CHECK (department_id = current_department_id());

-- Create a policy for update
CREATE POLICY employee_update_policy ON employees
    FOR UPDATE
    USING (department_id = current_department_id())
    WITH CHECK (department_id = current_department_id());

-- Create a policy for delete
CREATE POLICY employee_delete_policy ON employees
    FOR DELETE
    USING (department_id = current_department_id());
```

### Complex Policy Implementation
```sql
-- Multi-tenant policy
CREATE POLICY tenant_policy ON data
    USING (
        tenant_id = current_tenant_id()
        OR current_user_role() = 'super_admin'
    );

-- Hierarchical access policy
CREATE POLICY hierarchical_policy ON documents
    USING (
        EXISTS (
            SELECT 1 FROM document_access
            WHERE document_id = documents.id
            AND user_id = current_user_id()
            AND access_level >= required_access_level
        )
    );

-- Data sensitivity policy
CREATE POLICY sensitivity_policy ON confidential_data
    USING (
        EXISTS (
            SELECT 1 FROM user_clearance
            WHERE user_id = current_user_id()
            AND clearance_level >= data_sensitivity_level
        )
    );
```

## Policy Management

### Policy Modification
```sql
-- Alter an existing policy
ALTER POLICY employee_policy ON employees
    USING (department_id = current_department_id() AND status = 'active');

-- Drop a policy
DROP POLICY employee_policy ON employees;

-- Rename a policy
ALTER POLICY employee_policy ON employees RENAME TO department_policy;
```

### Policy Inspection
```sql
-- View all policies on a table
SELECT * FROM information_schema.table_policies
WHERE table_name = 'employees';

-- View policy details
SHOW CREATE POLICY employee_policy ON employees;

-- Check policy effectiveness
EXPLAIN SELECT * FROM employees;
```

### Policy Testing
```sql
-- Test policy with different users
SET SESSION AUTHORIZATION 'user1';
SELECT * FROM employees;  -- Should only see user1's department

SET SESSION AUTHORIZATION 'admin';
SELECT * FROM employees;  -- Should see all departments
```

## Advanced Policy Features

### Policy Combinations
```sql
-- Combine multiple policies
CREATE POLICY combined_policy ON sensitive_data
    USING (
        (current_user_role() = 'admin')
        OR (
            current_user_department() = department_id
            AND current_user_clearance() >= required_clearance
        )
    );
```

### Dynamic Policies
```sql
-- Policy with dynamic conditions
CREATE POLICY dynamic_policy ON data
    USING (
        CASE
            WHEN current_user_role() = 'admin' THEN TRUE
            WHEN current_user_role() = 'manager' THEN department_id = current_department_id()
            ELSE FALSE
        END
    );
```

### Policy Inheritance
```sql
-- Create base policy
CREATE POLICY base_policy ON base_table
    USING (tenant_id = current_tenant_id());

-- Inherit policy in child table
CREATE POLICY child_policy ON child_table
    INHERITS base_policy
    USING (additional_condition = TRUE);
```

### Policy with Audit
```sql
-- Policy with audit logging
CREATE POLICY audited_policy ON sensitive_data
    USING (
        CASE
            WHEN current_user_role() = 'admin' THEN TRUE
            ELSE (
                INSERT INTO audit_log (user_id, action, table_name, timestamp)
                VALUES (current_user_id(), 'SELECT', 'sensitive_data', NOW());
                department_id = current_department_id()
            )
        END
    );
```

## Best Practices

### 1. Policy Design
- Keep policies simple and focused
- Use meaningful policy names
- Document policy purposes
- Consider performance impact
- Test policies thoroughly

### 2. Security
- Follow principle of least privilege
- Implement defense in depth
- Regular policy review
- Monitor policy effectiveness
- Document security requirements

### 3. Performance
- Optimize policy conditions
- Use appropriate indexes
- Monitor query performance
- Consider caching strategies
- Regular performance testing

### 4. Maintenance
- Version control policies
- Document changes
- Regular policy review
- Monitor policy usage
- Backup policies

### 5. Testing
- Test with different users
- Test edge cases
- Performance testing
- Security testing
- Regular validation

## Common Use Cases

### Multi-Tenancy
```sql
-- Multi-tenant policy
CREATE POLICY tenant_isolation ON tenant_data
    USING (tenant_id = current_tenant_id());

-- Cross-tenant access
CREATE POLICY cross_tenant_access ON shared_data
    USING (
        tenant_id = current_tenant_id()
        OR EXISTS (
            SELECT 1 FROM tenant_sharing
            WHERE shared_tenant_id = tenant_id
            AND sharing_tenant_id = current_tenant_id()
        )
    );
```

### Departmental Access
```sql
-- Department access policy
CREATE POLICY department_access ON employee_data
    USING (
        department_id = current_department_id()
        OR EXISTS (
            SELECT 1 FROM department_hierarchy
            WHERE child_dept_id = department_id
            AND parent_dept_id = current_department_id()
        )
    );
```

### Data Sensitivity
```sql
-- Data sensitivity policy
CREATE POLICY data_sensitivity ON confidential_data
    USING (
        EXISTS (
            SELECT 1 FROM user_clearance
            WHERE user_id = current_user_id()
            AND clearance_level >= (
                SELECT sensitivity_level
                FROM data_classification
                WHERE data_id = confidential_data.id
            )
        )
    );
```

## Resources for Further Learning
- [MySQL Security Guide](https://dev.mysql.com/doc/refman/8.0/en/security.html)
- [MySQL Access Control](https://dev.mysql.com/doc/refman/8.0/en/access-control.html)
- [MySQL Privilege System](https://dev.mysql.com/doc/refman/8.0/en/privilege-system.html)
- [MySQL Security Best Practices](https://dev.mysql.com/doc/refman/8.0/en/security-best-practices.html) 