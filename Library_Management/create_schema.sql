
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100),
    publish_year INT,
    category VARCHAR(50),
    total_copies INT CHECK (total_copies >= 0),
    available_copies INT CHECK (available_copies >= 0)
);

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    join_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE DEFAULT CURRENT_DATE,
    due_date DATE,
    return_date DATE,
    status ENUM('borrowed', 'returned', 'late') DEFAULT 'borrowed',
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE librarians (
    librarian_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    hire_date DATE
);

CREATE TABLE fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT,
    fine_amount DECIMAL(8, 2),
    paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);
