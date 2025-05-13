# 📚 PostgreSQL Best Practices — All-in-One One-Liner Guide

## 🔐 Security Best Practices
- Use strong passwords and enforce password policies.  
- Enable SSL/TLS for all client connections.  
- Configure `pg_hba.conf` to restrict access by user, IP, and database.  
- Follow the principle of least privilege for database roles.  
- Avoid using superuser accounts for applications.  
- Use role-based access control (RBAC) to manage permissions.  
- Disable or remove unused accounts and roles regularly.  
- Limit network exposure; bind PostgreSQL to private/internal IPs only.  
- Use firewalls or security groups to restrict access to trusted IPs.  
- Enable logging of login attempts, queries, and errors.  
- Regularly audit logs for suspicious activity.  
- Encrypt sensitive data at rest using file system or TDE solutions.  
- Implement Row-Level Security (RLS) for granular data access control.  
- Keep PostgreSQL updated with the latest security patches.  
- Regularly scan for vulnerabilities using tools like `pgcluu` or `sqlmap`.  
- Use extensions like `pgAudit` for enhanced auditing capabilities.  
- Secure backups with encryption and access controls.  
- Monitor failed login attempts and block repeated ones using tools like `fail2ban`.  
- Use external authentication (e.g., LDAP, Kerberos, OAuth2) when possible.  
- Never expose PostgreSQL directly to the public internet without protection.

---

## 📐 DDL (Data Definition Language) Best Practices
- Use version-controlled schema migrations for all DDL changes.  
- Follow consistent naming conventions for tables, columns, and constraints.  
- Define primary keys explicitly for every main table.  
- Use appropriate data types (e.g., `TEXT`, `TIMESTAMPTZ`, `UUID`).  
- Apply constraints like `NOT NULL`, `UNIQUE`, and `CHECK` liberally.  
- Always define foreign keys to enforce referential integrity.  
- Index foreign key columns and frequently queried fields.  
- Use partial indexes when filtering specific data subsets.  
- Partition large tables to improve query performance and manageability.  
- Use views to encapsulate complex queries and simplify access.  
- Use materialized views for precomputed, non-real-time results.  
- Avoid using `DROP ... CASCADE` in production without review.  
- Use `IF NOT EXISTS` to safely idempotently run DDL scripts.  
- Add comments to database objects for better documentation.  
- Leverage extensions like `uuid-ossp`, `citext`, and `PostGIS` where applicable.  
- Plan schema changes carefully to avoid downtime or locks.  
- Set appropriate ownership and permissions on all objects.  
- Organize related tables into schemas for logical grouping.  
- Document your schema with ER diagrams or tools like pgAdmin.  
- Audit and track all schema changes in production.

---

## 🛡️ DCL (Data Control Language) Best Practices
- Always follow the principle of least privilege when granting permissions.  
- Use roles and groups to manage permissions instead of assigning them directly to users.  
- Avoid granting superuser privileges unless absolutely necessary.  
- Revoke unnecessary permissions regularly to reduce security risks.  
- Use `GRANT` and `REVOKE` statements explicitly for clarity and auditability.  
- Restrict access to sensitive data using Row-Level Security (RLS) policies.  
- Set default privileges for schemas using `ALTER DEFAULT PRIVILEGES` for consistency.  
- Never use the `PUBLIC` role to grant broad access unless intentional and secure.  
- Monitor and audit role membership and permission changes regularly.  
- Secure access to system catalogs by limiting `SELECT` on `pg_catalog` tables.  
- Use SSL connections to protect authentication and authorization traffic.  
- Rotate credentials and update access controls periodically.  
- Log and monitor failed login attempts and unauthorized access requests.  
- Use external authentication (LDAP, OAuth, etc.) where possible for centralized control.  
- Always document who has access to which objects and why.

---

## 💳 TCL (Transaction Control Language) Best Practices
- Always wrap multiple related DML operations in a transaction to ensure atomicity.  
- Use `BEGIN; ... COMMIT;` explicitly for critical data operations.  
- Roll back transactions on error using `ROLLBACK` to maintain data consistency.  
- Avoid leaving transactions open for long periods to reduce lock contention.  
- Set appropriate isolation levels (`READ COMMITTED`, `REPEATABLE READ`, etc.) based on your concurrency needs.  
- Use `SAVEPOINT`s to manage partial rollbacks within a transaction.  
- Test transaction behavior under load to avoid deadlocks and race conditions.  
- Monitor long-running transactions with `pg_stat_statements` or `pg_locks`.  
- Avoid autocommit in scripts or applications where transaction control is needed.  
- Commit or rollback before ending a session to prevent orphaned transactions.

---

## 🧹 DML (Data Manipulation Language) Best Practices
- Always use `WHERE` clauses with `UPDATE` and `DELETE` to avoid unintended data changes.  
- Use transactions for critical or multi-step DML operations.  
- Avoid full table scans by ensuring queries use appropriate indexes.  
- Use `LIMIT` with `DELETE` or `UPDATE` to reduce lock contention on large tables.  
- Batch large DML operations to minimize performance impact and transaction size.  
- Prefer `UPSERT` using `INSERT ... ON CONFLICT` instead of separate `UPDATE`/`INSERT`.  
- Use `RETURNING *` to get results from `INSERT`, `UPDATE`, or `DELETE` in a single roundtrip.  
- Avoid `SELECT *` — only fetch the columns you need.  
- Use parameterized queries to prevent SQL injection and improve query plan reuse.  
- Monitor long-running DML statements using `pg_stat_statements` or `pg_locks`.  
- Use CTEs for readability and complex DML logic.  
- Be cautious with `TRUNCATE` — it's fast but can't be filtered and resets sequences.  
- Always back up data before running destructive DML in production.  
- Use `READ COMMITTED` or `REPEATABLE READ` isolation levels based on your consistency needs.  
- Analyze performance using `EXPLAIN ANALYZE` before deploying DML queries.

---

## 🔍 DQL (Data Query Language) Best Practices
- Only select the columns you need — avoid `SELECT *`.  
- Always use `WHERE` clauses to filter results early and reduce data load.  
- Use `LIMIT` to restrict result set size unless retrieving all records is necessary.  
- Leverage indexes by writing queries that can use indexed columns efficiently.  
- Use `EXPLAIN ANALYZE` to understand and optimize query performance.  
- Avoid functions on indexed columns in `WHERE` clauses to maintain index usage.  
- Use `JOIN`s instead of subqueries when performance or readability is a concern.  
- Prefer `INNER JOIN` over `CROSS JOIN` unless a Cartesian product is intentional.  
- Use Common Table Expressions (`CTE`s) for readability and modular query design.  
- Filter early in subqueries or CTEs to reduce processing in later stages.  
- Use `ORDER BY` only when the result order matters.  
- Use `DISTINCT` sparingly — it adds overhead; ensure duplicates truly need removal.  
- Consider using materialized views or caching for frequently executed complex queries.  
- Use `ANALYZE` regularly to keep statistics up-to-date for better query planning.  
- Monitor slow queries using `pg_stat_statements` and optimize them.

---

## 🧱 Schema Management Best Practices
- Use schemas to logically group related database objects.  
- Avoid overloading the `public` schema in multi-application environments.  
- Implement schema-per-tenant or schema-per-application patterns for isolation.  
- Set user-specific `search_path` to control object resolution order.  
- Name schemas clearly and consistently (e.g., `finance`, `v2_api`).  
- Always version-control schema changes using migration tools.  
- Use idempotent and reversible migrations for safe deployments.  
- Test schema changes in staging before applying to production.  
- Apply transaction blocks to DDL where possible for atomicity.  
- Document schema usage and ownership for clarity and governance.  
- Restrict schema access with proper permissions (`GRANT`/`REVOKE`).  
- Monitor and audit schema changes in production environments.  
- Avoid hardcoding schema names in application logic when possible.  
- Clean up unused schemas to reduce clutter and security risks.

---

## 🔍 Index Management Best Practices
- Create indexes on frequently queried columns used in `WHERE`, `JOIN`, and `ORDER BY`.  
- Avoid over-indexing to prevent write performance degradation.  
- Choose the correct index type (`B-tree`, `GIN`, `BRIN`, etc.) based on query patterns.  
- Remove unused or redundant indexes regularly.  
- Rebuild bloated or outdated indexes using `REINDEX` or `CREATE INDEX CONCURRENTLY`.  
- Use partial indexes to improve performance on filtered datasets.  
- Consider covering indexes to include frequently accessed columns.  
- Use `EXPLAIN ANALYZE` to verify that queries are using expected indexes.  
- Run `VACUUM ANALYZE` regularly to maintain accurate statistics.  
- Build or rebuild indexes concurrently to avoid table locks.  
- Monitor index bloat and performance using tools like `pg_bloat_check`.  
- Evaluate index storage impact, especially for large tables.  
- Identify unused indexes with `pg_stat_user_indexes` where `idx_scan = 0`.  
- Drop duplicate or unnecessary indexes to reduce overhead.  
- Track index growth and usage trends over time.  
- Set up alerts for missing indexes or high bloat levels.  
- Always index foreign key columns to optimize joins and deletions.  
- Be strategic with composite indexes — column order matters.  
- Don’t index every column; only create indexes that significantly improve performance.  
- Use `GIN` or `GiST` indexes for full-text search with `tsvector`.  
- Use expression-based indexes for computed or transformed values (e.g., `LOWER(email)`).

---

## 🧰 Application-Level Best Practices
- Always use parameterized queries to prevent SQL injection.  
- Validate and sanitize all user inputs before using them in queries.  
- Connect to the database using a role with least privilege.  
- Store database credentials securely using secret management tools.  
- Enforce SSL/TLS for all database connections from the app.  
- Implement proper error handling without exposing DB details to users.  
- Use connection pooling (e.g., PgBouncer) to improve performance and security.  
- Encrypt sensitive data in transit between application and database.  
- Enable and monitor query logs for suspicious or unexpected activity.  
- Implement Row-Level Security (RLS) for fine-grained access control.  
- Wrap critical operations in transactions to ensure data consistency.  
- Avoid running schema-altering DDL statements dynamically from the app.  
- Implement rate limiting to protect against abuse and brute-force attacks.  
- Use UUIDs instead of sequential IDs to avoid ID guessing attacks.  
- Monitor and optimize query performance to reduce load and latency.

---

# ✅ Final Notes
This document can be:
- Printed as a **cheat sheet**
- Saved as a **PDF for easy sharing**
- Used as a **checklist during code reviews or deployment**
