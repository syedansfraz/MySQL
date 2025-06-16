DELIMITER //

CREATE PROCEDURE add_book (
    IN p_title VARCHAR(100),
    IN p_author VARCHAR(100),
    IN p_copies INT
)
BEGIN
    INSERT INTO books (title, author, copies)
    VALUES (p_title, p_author, p_copies);
END;
//

CREATE PROCEDURE register_member (
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO members (name, email)
    VALUES (p_name, p_email);
END;
//

CREATE PROCEDURE borrow_book (
    IN p_book_id INT,
    IN p_member_id INT,
    IN p_borrow_date DATE
)
BEGIN
    DECLARE available_copies INT;

    SELECT copies INTO available_copies
    FROM books
    WHERE book_id = p_book_id;

    IF available_copies > 0 THEN
        INSERT INTO borrowings (book_id, member_id, borrow_date)
        VALUES (p_book_id, p_member_id, p_borrow_date);

        UPDATE books
        SET copies = copies - 1
        WHERE book_id = p_book_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No copies available';
    END IF;
END;
//

CREATE PROCEDURE return_book (
    IN p_borrow_id INT,
    IN p_return_date DATE
)
BEGIN
    DECLARE book INT;

    SELECT book_id INTO book
    FROM borrowings
    WHERE borrow_id = p_borrow_id;

    UPDATE borrowings
    SET return_date = p_return_date
    WHERE borrow_id = p_borrow_id;

    UPDATE books
    SET copies = copies + 1
    WHERE book_id = book;
END;
//

CREATE PROCEDURE member_history (
    IN p_member_id INT
)
BEGIN
    SELECT b.title, br.borrow_date, br.return_date
    FROM borrowings br
    JOIN books b ON br.book_id = b.book_id
    WHERE br.member_id = p_member_id;
END;
//

DELIMITER ;