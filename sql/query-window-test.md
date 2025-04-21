-- Command to create the Customers table
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50)
);
-- Command to insert data into the Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, City) VALUES
(1, 'John', 'Doe', 'London'),
(2, 'Jane', 'Smith', 'Paris'),
(3, 'Peter', 'Jones', 'London'),
(4, 'Alice', 'Brown', 'New York'),
(5, 'Bob', 'Williams', 'Paris');

```
```sql

-- Command to create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Command to insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-01-15', 100.50),
(102, 2, '2023-01-20', 250.00),
(103, 1, '2023-02-10', 75.25),
(104, 3, '2023-03-01', 300.75),
(105, 2, '2023-03-15', 120.00),
(106, 4, '2023-04-01', 300.75),
(107, 5, '2023-04-10', 50.00),
(108, 1, '2023-05-01', 180.99);
```
-- You can now run your SQL queries against these tables and data.

/*
-- Write a SQL query to rank customers based on their total spending. 
-- The ranking should be within each city. 
-- The customer with the highest total spending in each city should have a rank of 1. 
-- Display City, FirstName, LastName, TotalSpending, and Rank.
*/

```SQL
select 
	c.city,
	c.firstname,
	c.lastname,
	t.totalspending,
	DENSE_RANK() OVER(PARTITION BY city ORDER BY totalspending desc) as rank
from 
(
	select 
	customerid, 
	sum(totalamount) totalspending
	from orders
	group by customerid
) t
Inner join customers as c ON c.customerid = t.customerid
order by c.city, rank asc;```

/*
-- Write a SQL query to find the cumulative total amount spent by each customer over time. 
-- The result should display CustomerID, OrderDate, TotalAmount, and CumulativeTotal. Order the results by CustomerID and OrderDate.
*/

```SQL
select 
customerid, 
orderdate,
totalamount,
sum(totalamount) OVER(PARTITION BY customerid ORDER BY orderdate) totalAmount
from orders order by customerid, orderdate
```
