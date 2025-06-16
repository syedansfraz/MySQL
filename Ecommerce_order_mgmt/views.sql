
USE library_db;

CREATE VIEW v_current_loans AS
SELECT 
    l.loan_id, m.name AS member_name, b.title AS book_title, 
     l.due_date, l.status
FROM loans l
JOIN members m ON l.member_id = m.member_id
JOIN books b ON l.book_id = b.book_id
WHERE l.status = 'borrowed';