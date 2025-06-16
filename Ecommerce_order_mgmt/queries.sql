
-- Overdue books
SELECT * FROM loans
WHERE status = 'borrowed' AND due_date < CURRENT_DATE;

-- Fine summary
SELECT 
    m.name, SUM(f.fine_amount) AS total_due
FROM fines f
JOIN loans l ON f.loan_id = l.loan_id
JOIN members m ON l.member_id = m.member_id
WHERE f.paid = FALSE
GROUP BY m.name;
