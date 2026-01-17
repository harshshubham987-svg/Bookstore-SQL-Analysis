-- Database: PostgreSQL
-- Project: Bookstore Sales Analysis

-- Simple SELECT queries
-- Filtering, sorting, basic joins

-- 1. Reterieve all books in the "Fiction" genre:

select * from Books;
--solution
select * from Books 
where genre = 'Fiction';

--2. Find books published after the year 1950:
select Book_id, Title, Published_Year
from Books
where Published_Year > 1950;

--3. List all customers from the Canada:
select * from Customers;		-- we use Customers table to solve this;
--solution
select Customer_id, C_Name, Country
from customers
where Country = 'Canada';

-- 4) Show orders placed in November 2023:
select * from Orders;		--we use orders table for this
--solution
select Order_id, Order_date
from Orders
where order_date between '01-11-2023' and '30-11-2023';

-- 5) Retrieve the total stock of books available:
select * from Books;
select sum(stock) as total_stock_of_Books
from Books;

-- 6) Find the details of the most expensive book:
select * from Books
order by price DESC
limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select c.Customer_id,c.C_Name,o.Quantity
from Customers c
inner join Orders o
on c.Customer_id = o.Customer_id
where o.quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from Orders;
-- solution
select Order_id, total_amount
from Orders
where total_amount >20;

-- 9) List all genres available in the Books table:
select Distinct genre from Books;

-- 10) Find the book with the lowest stock:
select * from Books
order by stock
limit 1;

-- 11) Calculate the total revenue generated from all orders:
select sum(total_amount) as Total_Revenue_generate
from Orders;
