-- Database: PostgreSQL
-- Project: Bookstore Sales Analysis

-- Joins, GROUP BY, HAVING
-- Aggregations, business questions

-- 1) Retrieve the total number of books sold for each genre:
select b.Genre, sum(o.Quantity) as total_sold_book
from Books b
inner join Orders o
on b.Book_id = o.Book_id
group by b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
select Genre , avg(price)
from Books
where genre = 'Fantasy'
group by Genre;

-- 3) List customers who have placed at least 2 orders:
select c.C_Name, count(o.Order_id) as total_count
from Customers c
inner join Orders o
on c.Customer_id = o.Customer_id
group by c.C_Name
having count(o.order_id) >= 2;


-- 4) Find the most frequently ordered book:
select  * from Orders;
--------------------------
select b.Title ,b.book_id , count(o.book_id) as frequently_ordered
from Books b
join Orders o
on b.book_id = o.book_id
group by b.title , b.book_id
order by count(o.book_id) DESC
limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select book_id, title, genre, price
from books
where genre = 'Fantasy'
order by price DESC
limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
select b.Author, sum(o.quantity) as total_quantity
from Books b
inner join Orders o
on b.book_id = o.book_id
group by b.Author;

-- 7) List the cities where customers who spent over $30 are located:
select c.city 
from Customers c
inner join orders o
on c.customer_id = o.customer_id
where o.total_amount > 30
group by city;

-- 8) Find the customer who spent the most on orders:
select c.Customer_id, c.c_name, sum(o.total_amount) as total_spent
from Customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.c_name
order by sum(o.total_amount) DESC
limit 1;

--9) Calculate the stock remaining after fulfilling all orders:
select b.book_id, b.title, b.stock, COALESCE(sum(o.Quantity),0)as total_order_qty,
b.stock - coalesce(sum(o.quantity),0) as remaining_stock
from Books b
left join Orders o
on b.book_id = o.book_id
group by b.book_id;
