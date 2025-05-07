CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary INT CHECK( salary >= 30000)
);

INSERT INTO employees (first_name, last_name, email, salary)
VALUES
('John','Doe','john.doe@example.com',35000),
('John','Smith','john.smith@example.com',45000),
('MIe','Doe','mie.doe@axe.com',55000),
('Jane','Miller','jane.miller@example.com',65000),
('John','Pie','john.pie@ample.com',35000);

select * from employees where salary > 50000;
select coalesce(first_name, ' ') || ' ' || coalesce(last_name, ' ') as full_name from employees
select * from employees where email LIKE '%example.com'
update employees set salary = 40000 where salary < 40000;
delete from employees where last_name = 'Doe';

----------------
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
  	manager_id INT, 	
	FOREIGN KEY (manager_id) REFERENCES employees(id)
);

ALTER TABLE employees 
ADD COLUMN department_id  INT; 
ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(id)

INSERT INTO departments (name, manager_id)
VALUES
('Engineering',4),
('Marketing',2),
('Data Science',5);

UPDATE employees SET department_id = 1 WHERE id IN (1,3);
UPDATE employees SET department_id = 2 WHERE id IN (2);
UPDATE employees SET department_id = 3 WHERE id IN (1,2,3);

SELECT 
	d.name as department_name,
	COUNT(e.id) as total_employees
FROM public.employees as e
INNER JOIN public.departments as d 
ON d.id = e.department_id
group by d.name

SELECT 
	d.name as department_name,
	AVG(e.salary) as avg_salary
FROM public.employees as e
INNER JOIN public.departments as d 
ON d.id = e.department_id
group by d.name;

SELECT 
	d.name as department_name,
	COUNT(e.id) as total_employees
FROM public.employees as e
INNER JOIN public.departments as d 
ON d.id = e.department_id
group by d.name
having COUNT(e.id) > 1


SELECT 
	e.first_name,
	e.last_name,
	e.email,
	d.name as department_name
FROM public.employees as e
INNER JOIN public.departments as d 
ON d.id = e.department_id


WITH AVG_SAL AS (
	SELECT 
		e.department_id,
		AVG(e.salary) as avg_salary
	FROM public.employees as e
	group by e.department_id
)
select first_name, last_name, salary, e.department_id
from 
employees as e
JOIN AVG_SAL as avg_sal ON avg_sal.department_id = e.department_id
where e.salary > avg_sal.avg_salary

WITH HIGHEST_SAL AS (
	SELECT 
		e.department_id,
		MAX(e.salary) as max_salary, 
		RANK() OVER(ORDER BY MAX(e.salary) DESC) as rank
	FROM public.employees as e
	group by e.department_id
)
select first_name, last_name, salary, e.department_id
from 
employees as e,
HIGHEST_SAL as hs
where hs.rank > 2;

WITH ranked_employees AS (
    SELECT
        e.first_name,
        e.last_name,
        e.salary,
        d.name AS department_name,
        ROW_NUMBER() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS salary_rank
    FROM employees e
    JOIN departments d ON e.department_id = d.id
)
SELECT first_name, last_name, salary, department_name
FROM ranked_employees
WHERE salary_rank <= 2
ORDER BY department_name, salary DESC;