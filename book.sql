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
