
USE library_db;

DELIMITER //
CREATE PROCEDURE return_book(IN p_loan_id INT)
BEGIN
    UPDATE loans
    SET status = 'returned', return_date = CURRENT_DATE
    WHERE loan_id = p_loan_id;
END;
//
DELIMITER ;
