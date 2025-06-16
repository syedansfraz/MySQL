
USE library_db;

DELIMITER //
CREATE TRIGGER trg_set_due_date
BEFORE INSERT ON loans
FOR EACH ROW
BEGIN
    SET NEW.due_date = DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY);
END;
//

CREATE TRIGGER trg_update_available_on_loan
AFTER INSERT ON loans
FOR EACH ROW
BEGIN
    UPDATE books SET available_copies = available_copies - 1 WHERE book_id = NEW.book_id;
END;
//

CREATE TRIGGER trg_update_available_on_return
AFTER UPDATE ON loans
FOR EACH ROW
BEGIN
    IF NEW.status = 'returned' THEN
        UPDATE books SET available_copies = available_copies + 1 WHERE book_id = NEW.book_id;
    END IF;
END;
//
DELIMITER ;
