
SPOOL C:\cprg250s\Lab_subqueries\subqueries_output.txt

-- =====================================
-- QUESTION 1 (Most Popular Destination)
-- =====================================
SET LINESIZE 100;

COLUMN TOUR_DESCRIPTION FORMAT A40;
COLUMN NUMBER FORMAT 9;

SELECT vt.tour_description, t.total_customers
FROM rcv_vacation_tour vt
JOIN (
    SELECT tour_code, COUNT(*) AS total_customers
    FROM rcv_tour_customer
    GROUP BY tour_code
    HAVING COUNT(*) = (
        SELECT MAX(COUNT(*))
        FROM rcv_tour_customer
        GROUP BY tour_code
    )
) t ON vt.tour_code = t.tour_code;

-- =====================================
-- QUESTION 2 (Lionel Messie)
-- =====================================

SET LINESIZE 150;

COLUMN FIRST_NAME FORMAT A15;
COLUMN LAST_NAME FORMAT A21;
COLUMN TOUR_DESCRIPTION FORMAT A30;
COLUMN DEST_DESCRIPTION FORMAT A67;

SELECT 
    c.first_name,
    c.last_name,
    t.tour_description,
    d.dest_description
FROM rcv_customer c
JOIN rcv_tour_customer tc 
    ON c.customer_number = tc.customer_number
JOIN rcv_vacation_tour t 
    ON tc.tour_code = t.tour_code
JOIN rcv_tour_destination td
    ON t.tour_code = td.tour_code
JOIN rcv_destination d
    ON td.dest_code = d.dest_code
WHERE d.dest_code IN (
    SELECT td2.dest_code
    FROM rcv_customer c2
    JOIN rcv_tour_customer tc2
      ON c2.customer_number = tc2.customer_number
    JOIN rcv_tour_destination td2
      ON tc2.tour_code = td2.tour_code
    WHERE c2.first_name = 'Lionel'
      AND c2.last_name = 'Messie'
)
AND NOT (
    c.first_name = 'Lionel'
    AND c.last_name = 'Messie'
)
ORDER BY c.first_name, c.last_name;

CLEAR COLUMNS;


SPOOL off