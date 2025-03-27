-- Active: 1742201819365@@127.0.0.1@5432@bookshop_db


-- Table to store book details
CREATE TABLE books (
    id SERIAL PRIMARY KEY,  
    title VARCHAR(50),  
    author VARCHAR(50),  
    price INT,  
    stock BOOLEAN,  
    published_year DATE  
);

-- Inserting books data 
INSERT INTO books (title, author, price, stock, published_year) VALUES
('Brave New World', 'Aldous Huxley', 16, TRUE, '1932-08-31'),
('The Odyssey', 'Homer', 10, FALSE, '800-01-01'),  -- Out of stock
('The Divine Comedy', 'Dante Alighieri', 28, TRUE, '1320-01-01'),
('One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 24, FALSE, '1967-05-30'),  -- Out of stock
('The Brothers Karamazov', 'Fyodor Dostoevsky', 21, TRUE, '1880-11-01'),
('Anna Karenina', 'Leo Tolstoy', 23, TRUE, '1878-01-01'),
('The Alchemist', 'Paulo Coelho', 13, FALSE, '1988-04-01'),  -- Out of stock
('Don Quixote', 'Miguel de Cervantes', 26, TRUE, '1605-01-16'),
('Wuthering Heights', 'Emily Brontë', 18, TRUE, '1847-12-01'),
('Dracula', 'Bram Stoker', 15, FALSE, '1897-05-26');  -- Out of stock


--  Table to customer details 
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    joined_date DATE
);

-- Inserting customers 
INSERT INTO customers (customer_name, email, joined_date) VALUES
('John Doe', 'john.doe@example.com', '2023-01-15'),
('Jane Smith', 'jane.smith@example.com', '2023-02-20'),
('Alice Johnson', 'alice.johnson@example.com', '2023-03-10'),
('Bob Brown', 'bob.brown@example.com', '2023-04-05'),
('Charlie Davis', 'charlie.davis@example.com', '2023-05-22'),
('Diana Wilson', 'diana.wilson@example.com', '2023-06-18'),
('Eve Adams', 'eve.adams@example.com', '2023-07-09'),
('Frank White', 'frank.white@example.com', '2023-08-14'),
('Grace Lee', 'grace.lee@example.com', '2023-09-12'),
('Hank Harris', 'hank.harris@example.com', '2023-10-01');


-- Create a order table 
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    book_id INTEGER REFERENCES books(id),
    quantity INT,
    order_date DATE
);

SELECT * FROM customer;

-- Inserting orders
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 1, 2, '2023-01-15'),
(2, 2, 1, '2023-02-20'),
(3, 3, 3, '2023-03-10'),
(4, 4, 1, '2023-04-05'),
(5, 5, 5, '2023-05-22'),
(6, 6, 2, '2023-06-18'),
(7, 7, 4, '2023-07-09'),
(8, 8, 3, '2023-08-14'),
(9, 9, 1, '2023-09-12'),
(10, 10, 1, '2023-10-01'),
(1, 1, 1, '2023-11-05'),
(2, 3, 2, '2023-12-15'),
(3, 2, 1, '2024-01-20'),
(4, 4, 3, '2024-02-25'),
(5, 6, 1, '2024-03-30');


-- Find books that are out of stock.
SELECT * FROM books WHERE stock = FALSE ;



--  Retrieve the most expensive book in the store.
SELECT * FROM books ORDER BY price DESC LIMIT 1;


-- Calculate the total revenue generated from book sales.
SELECT SUM(orders.quantity * books.price) AS total_revenue
FROM orders 
JOIN books ON orders.book_id = books.id;



-- Find the average price of books in the store.
SELECT avg(price)as avg_book_price FROM books;

--  Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price = price * 1.10
WHERE published_year < '2000-01-01';
