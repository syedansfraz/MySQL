
USE library_db;

INSERT INTO books (isbn, title, author, publisher, publish_year, category, total_copies, available_copies)
VALUES 
('9780140449266', 'The Odyssey', 'Homer', 'Penguin', 2003, 'Epic', 5, 5),
('9780132350884', 'Clean Code', 'Robert Martin', 'Prentice Hall', 2008, 'Programming', 3, 3);

INSERT INTO members (name, email, phone, address)
VALUES 
('Alice', 'alice@example.com', '1234567890', '123 Main St'),
('Bob', 'bob@example.com', '0987654321', '456 Oak Ave');

INSERT INTO librarians (name, email, phone, hire_date)
VALUES 
('Jane Doe', 'jane@library.com', '1112223333', '2022-01-10');
