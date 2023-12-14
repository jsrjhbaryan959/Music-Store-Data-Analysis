-- Q1. Who is the senior most employee based on job title?
SELECT * FROM employee
order by levels desc
limit 1

-- Q2. Which country has most invoices?
SELECT COUNT(*) as c, billing_country
FROM invoice
group by billing_country
order by c desc

-- Q3. What are top 3 values of total invoices?
SELECT * from invoice
order by total desc
limit 3

-- Q4. Which city has the best customers? We would like to throw a promotional
-- Music Festival in the city we made the most money. Write a query that returns 
-- one city that has the highest sum of invoices totals. Return both the city name
-- & sum of all invoice details.
select billing_city, SUM(total) as invoice_total
from invoice
group by billing_city
order by invoice_total desc

-- Q5. Who is the best customer? The cutsomer who has spent the most money will
-- be declared the best customer. Write a query that returns the person who has
-- spent the most money. - We make the use of schema in this when there is no column 
-- of total in customer. We have to join it with invoice table.
select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc
limit 1
