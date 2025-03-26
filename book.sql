-- Active: 1742201819365@@127.0.0.1@5432@bookshop_db


-- Table to store book details
CREATE TABLE book (
    id SERIAL PRIMARY KEY,  
    title VARCHAR(50),  
    author VARCHAR(50),  
    price INT,  
    stock BOOLEAN,  
    published_year DATE  
);

--  Table to customer details 
CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    joined_date DATE
);

-- Create a order table 
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customer(id),
    book_id INTEGER REFERENCES book(id),
    quantity INT,
    order_date DATE
);