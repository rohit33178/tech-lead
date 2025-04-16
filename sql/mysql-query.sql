-- =============================================
-- 1. SCHEMA AND DATABASE SETUP
-- =============================================
-- Drop and recreate schema
DROP SCHEMA IF EXISTS tbl_ref CASCADE;
CREATE SCHEMA IF NOT EXISTS tbl_ref;

-- =============================================
-- 2. TABLE DEFINITIONS
-- =============================================
-- Create audit log table
CREATE TABLE tbl_ref.audit_log (
    id SERIAL PRIMARY KEY,
    table_name TEXT NOT NULL,
    column_name TEXT NOT NULL,
    old_value TEXT,
    new_value TEXT,
    changed_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    changed_by TEXT
);

-- ### create affiliate table ### --
-- This table stores information about affiliates

-- fields: id, country_name, country_code, created_at, updated_at
-- country_name: name of the country
-- country_code: 2-letter ISO code for the country
-- created_at: timestamp of when the record was created
-- updated_at: timestamp of when the record was last updated

CREATE TABLE IF NOT EXISTS tbl_ref.tbl_affiliates (
    id SERIAL PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL,
    country_code VARCHAR(10) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- add policy for row level security
ALTER TABLE tbl_ref.tbl_affiliates ENABLE ROW LEVEL SECURITY;

-- Create policy for row level security as loggedin user
CREATE POLICY tbl_affiliates_policy ON tbl_ref.tbl_affiliates
    FOR ALL
    USING (true);
-- Create policy for row level security as admin user
CREATE POLICY tbl_affiliates_policy_admin ON tbl_ref.tbl_affiliates
    FOR ALL
    USING (true);   
-- Create policy for row level security as superuser
CREATE POLICY tbl_affiliates_policy_superuser ON tbl_ref.tbl_affiliates
    FOR ALL
    USING (true);
-- Create policy for row level security as test_user
CREATE POLICY tbl_affiliates_policy_test_user ON tbl_ref.tbl_affiliates
    FOR ALL
    USING (true);

-- policy for create, update, delete and select for own record
CREATE POLICY tbl_affiliates_policy_own_record ON tbl_ref.tbl_affiliates
    FOR ALL
    USING (user_id = current_user_id());
-- policy for create, update, delete and select for all record
CREATE POLICY tbl_affiliates_policy_all_record ON tbl_ref.tbl_affiliates
    FOR ALL
    USING (true);


-- Add constraints to affiliates table
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_name_unique UNIQUE (country_name),
ADD CONSTRAINT tbl_affiliates_country_code_unique UNIQUE (country_code);

-- Add check constraint to ensure country_code is uppercase
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_code_uppercase CHECK (country_code = UPPER(country_code));

-- Add check constraint to ensure country_code is not empty
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_code_not_empty CHECK (country_code <> '');

-- Add check constraint to ensure country_name is not empty
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_name_not_empty CHECK (country_name <> '');

-- Add check constraint to ensure country_name is not null
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_name_not_null CHECK (country_name IS NOT NULL);

-- Add check constraint to ensure country_code is not null
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_code_not_null CHECK (country_code IS NOT NULL);

-- Add check constraint to ensure country_name is not too long
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_name_length CHECK (LENGTH(country_name) <= 255);
-- Add check constraint to ensure country_code is not too long
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_code_length CHECK (LENGTH(country_code) <= 10);
-- Add check constraint to ensure country_code is not too short
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_code_length_min CHECK (LENGTH(country_code) >= 2);
-- Add check constraint to ensure country_code is not too short
ALTER TABLE tbl_ref.tbl_affiliates
ADD CONSTRAINT tbl_affiliates_country_code_length_max CHECK (LENGTH(country_code) <= 3);

-- ### create hierarchy table ### --
-- This table stores hierarchical relationships between accounts

-- fields: id,affiliate, account_id, account_name, parent_id, parent_name, created_at, updated_at
-- id: unique identifier for the record
-- affiliate: unique identifier for the affiliate
-- account_id: unique identifier for the account
-- account_name: name of the account
-- parent_id: unique identifier for the parent account
-- parent_name: name of the parent account
-- created_at: timestamp of when the record was created
-- updated_at: timestamp of when the record was last updated

CREATE TABLE IF NOT EXISTS tbl_ref.tbl_hierarchy (
    id SERIAL PRIMARY KEY,
    affiliate INT NOT NULL REFERENCES tbl_ref.tbl_affiliates(id),
    account_id INT NOT NULL,
    account_name VARCHAR(255) NOT NULL,
    parent_id INT REFERENCES tbl_ref.tbl_hierarchy(id),
    parent_name VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Add constraints to hierarchical table
ALTER TABLE tbl_ref.tbl_hierarchy
ADD CONSTRAINT tbl_hierarchy_account_id_unique UNIQUE (account_id),
ADD CONSTRAINT tbl_hierarchy_account_name_unique UNIQUE (account_name);

-- Add check constraint to ensure account_id is positive
ALTER TABLE tbl_ref.tbl_hierarchy
ADD CONSTRAINT tbl_hierarchy_account_id_positive CHECK (account_id > 0);

-- Add check constraint to ensure account_name is not empty
ALTER TABLE tbl_ref.tbl_hierarchy
ADD CONSTRAINT tbl_hierarchy_account_name_not_empty CHECK (account_name <> '');

-- Add check constraint to ensure account_name is not null
ALTER TABLE tbl_ref.tbl_hierarchy
ADD CONSTRAINT tbl_hierarchy_account_name_not_null CHECK (account_name IS NOT NULL);

-- Add check constraint to ensure parent_id is not empty
ALTER TABLE tbl_ref.tbl_hierarchy
ADD CONSTRAINT tbl_hierarchy_parent_id_not_empty CHECK (parent_id <> '');

-- Add check constraint to ensure parent_id is not null
ALTER TABLE tbl_ref.tbl_hierarchy
ADD CONSTRAINT tbl_hierarchy_parent_id_not_null CHECK (parent_id IS NOT NULL);

-- Add check constraint to ensure parent_name is not empty
ALTER TABLE tbl_ref.tbl_hierarchy
ADD CONSTRAINT tbl_hierarchy_parent_name_not_empty CHECK (parent_name <> '');

-- Add check constraint to ensure parent_name is not null
ALTER TABLE tbl_ref.tbl_hierarchy
ADD CONSTRAINT tbl_hierarchy_parent_name_not_null CHECK (parent_name IS NOT NULL);



-- =============================================
-- 3. INDEX DEFINITIONS
-- =============================================
-- Indexes for audit_log
CREATE INDEX audit_log_changed_at_idx ON tbl_ref.audit_log (changed_at);
CREATE INDEX audit_log_table_name_idx ON tbl_ref.audit_log (table_name);
CREATE INDEX audit_log_changed_by_idx ON tbl_ref.audit_log (changed_by);

-- Indexes for affiliates
CREATE INDEX tbl_affiliates_country_name_idx ON tbl_ref.tbl_affiliates (country_name);
CREATE INDEX tbl_affiliates_country_code_idx ON tbl_ref.tbl_affiliates (country_code);
CREATE INDEX tbl_affiliates_created_at_idx ON tbl_ref.tbl_affiliates (created_at);

-- Indexes for hierarchical
CREATE INDEX tbl_hierarchy_account_id_idx ON tbl_ref.tbl_hierarchy (account_id);
CREATE INDEX tbl_hierarchy_account_name_idx ON tbl_ref.tbl_hierarchy (account_name);
CREATE INDEX tbl_hierarchy_parent_id_idx ON tbl_ref.tbl_hierarchy (parent_id);
CREATE INDEX tbl_hierarchy_parent_name_idx ON tbl_ref.tbl_hierarchy (parent_name);

-- =============================================
-- 4. TRIGGER FUNCTION
-- =============================================

-- Create trigger function for auditing
DROP FUNCTION IF EXISTS tbl_ref.audit_trigger_function() CASCADE;
CREATE OR REPLACE FUNCTION tbl_ref.audit_trigger_function()
RETURNS TRIGGER AS $$
DECLARE
    old_value text;
    new_value text;
    column_name text;
BEGIN
    IF TG_ARGV IS NULL OR array_length(TG_ARGV, 1) IS NULL THEN
        RAISE EXCEPTION 'No columns specified for auditing';
    END IF;

    FOR i IN 1..array_length(TG_ARGV, 1) LOOP
        column_name := TG_ARGV[i];
        
        IF column_name IS NULL THEN
            CONTINUE;
        END IF;

        IF (TG_OP = 'UPDATE') THEN
            EXECUTE format('SELECT ($1).%I::text', column_name)
            USING OLD INTO old_value;
            
            EXECUTE format('SELECT ($1).%I::text', column_name)
            USING NEW INTO new_value;
            
            IF old_value IS DISTINCT FROM new_value THEN
                INSERT INTO tbl_ref.audit_log (table_name, column_name, old_value, new_value, changed_by)
                VALUES (TG_TABLE_NAME, column_name, old_value, new_value, current_user);
            END IF;

        ELSIF (TG_OP = 'INSERT') THEN
            EXECUTE format('SELECT ($1).%I::text', column_name)
            USING NEW INTO new_value;
            
            INSERT INTO tbl_ref.audit_log (table_name, column_name, old_value, new_value, changed_by)
            VALUES (TG_TABLE_NAME, column_name, NULL, new_value, current_user);

        ELSIF (TG_OP = 'DELETE') THEN
            EXECUTE format('SELECT ($1).%I::text', column_name)
            USING OLD INTO old_value;
            
            INSERT INTO tbl_ref.audit_log (table_name, column_name, old_value, new_value, changed_by)
            VALUES (TG_TABLE_NAME, column_name, old_value, NULL, current_user);
        END IF;
    END LOOP;

    IF (TG_OP = 'DELETE') THEN
        RETURN OLD;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- 5. TRIGGER SETUP
-- =============================================
DROP TRIGGER IF EXISTS audit_trigger ON tbl_ref.tbl_affiliates;

CREATE TRIGGER audit_trigger
AFTER INSERT OR UPDATE OR DELETE ON tbl_ref.tbl_affiliates
FOR EACH ROW
EXECUTE FUNCTION tbl_ref.audit_trigger_function('id', 'country_name', 'country_code');

-- =============================================
-- 6. USER MANAGEMENT AND PERMISSIONS
-- =============================================
-- Drop user if exists
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'test_user') THEN
        DROP USER test_user;
    END IF;
END $$;
-- Create user
CREATE USER test_user WITH PASSWORD 'Rohit@33178';

-- Grant basic permissions
GRANT USAGE ON SCHEMA tbl_ref TO test_user;
GRANT CONNECT ON DATABASE "LaunchPad" TO test_user;

-- Grant table permissions
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA tbl_ref TO test_user;

-- Grant sequence permissions
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA tbl_ref TO test_user;

-- add all types of permission for test_user
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA tbl_ref TO test_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA tbl_ref TO test_user;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA tbl_ref TO test_user;
GRANT ALL PRIVILEGES ON ALL PROCEDURES IN SCHEMA tbl_ref TO test_user;
GRANT ALL PRIVILEGES ON ALL TYPES IN SCHEMA tbl_ref TO test_user;
GRANT ALL PRIVILEGES ON ALL MATERIALIZED VIEWS IN SCHEMA tbl_ref TO test_user;


-- Set default privileges 
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref GRANT SELECT, INSERT, UPDATE ON TABLES TO test_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref GRANT USAGE, SELECT ON SEQUENCES TO test_user;

-- add all types of default privileges for test_user
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref GRANT ALL PRIVILEGES ON TABLES TO test_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref GRANT ALL PRIVILEGES ON SEQUENCES TO test_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref GRANT ALL PRIVILEGES ON FUNCTIONS TO test_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref GRANT ALL PRIVILEGES ON PROCEDURES TO test_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref GRANT ALL PRIVILEGES ON TYPES TO test_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref GRANT ALL PRIVILEGES ON MATERIALIZED VIEWS TO test_user;


-- =============================================
-- 7. PERMISSION MANAGEMENT QUERIES
-- =============================================
-- Revoke specific privileges
REVOKE INSERT, UPDATE ON ALL TABLES IN SCHEMA tbl_ref FROM test_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tbl_ref
    REVOKE INSERT, UPDATE ON TABLES FROM test_user;

-- View privileges (comma-separated format)
SELECT 
    grantee,
    table_schema,
    table_name,
    string_agg(privilege_type, ', ' ORDER BY privilege_type) as privileges
FROM information_schema.table_privileges 
WHERE grantee = 'test_user' 
AND table_schema = 'tbl_ref'
GROUP BY grantee, table_schema, table_name
ORDER BY table_schema, table_name;

-- View privileges (JSON format)
SELECT 
    grantee,
    table_schema,
    table_name,
    json_agg(privilege_type ORDER BY privilege_type) as privileges_json
FROM information_schema.table_privileges 
WHERE grantee = 'test_user' 
AND table_schema = 'tbl_ref'
GROUP BY grantee, table_schema, table_name
ORDER BY table_schema, table_name;

-- =============================================
-- 8. UTILITY QUERIES
-- =============================================
-- Check indexes
SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'tbl_ref'
ORDER BY tablename, indexname;

-- Check triggers
SELECT tgname, tgrelid::regclass AS table_name, tgenabled
FROM pg_trigger
WHERE tgrelid::regclass::text LIKE 'tbl_ref.%';

-- Check index usage statistics
SELECT COUNT(*) FROM pg_indexes 
WHERE schemaname = 'tbl_ref' AND tablename = 'tbl_affiliates';

SELECT indexname, COUNT(*)
FROM pg_indexes
WHERE schemaname = 'tbl_ref' AND tablename = 'tbl_affiliates'
GROUP BY indexname
ORDER BY indexname;

-- =============================================
-- 9. SAMPLE DATA OPERATIONS
-- =============================================
-- Insert sample data
INSERT INTO tbl_ref.tbl_affiliates (country_name, country_code) 
VALUES ('United States', 'US');

-- Query sample data
SELECT * FROM tbl_ref.tbl_affiliates;

-- View audit log summary
SELECT table_name, column_name, changed_by, COUNT(*) AS change_count
FROM tbl_ref.audit_log
GROUP BY table_name, column_name, changed_by
ORDER BY table_name, column_name, changed_by;
