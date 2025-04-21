-- Write a SQL query to rank customers based on their total spending. 
-- The ranking should be within each city. 
-- The customer with the highest total spending in each city should have a rank of 1. 
-- Display City, FirstName, LastName, TotalSpending, and Rank.

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
order by c.city, rank asc;
