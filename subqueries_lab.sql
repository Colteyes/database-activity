
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

-- =====================================
-- QUESTION 3 (Agents above average sales)
-- =====================================

SET LINESIZE 150;

COLUMN AGENT_NAME FORMAT A30;
COLUMN TOTAL_VALUE FORMAT 999999.99;

SELECT 
    a.first_name || ' ' || a.last_name AS agent_name,
    SUM(d.price) AS total_value
FROM rcv_agent a
JOIN rcv_customer c
    ON a.agent_code = c.agent_code
JOIN rcv_tour_customer tc 
    ON c.customer_number = tc.customer_number
JOIN rcv_vacation_tour t 
    ON tc.tour_code = t.tour_code
JOIN rcv_tour_destination td 
    ON t.tour_code = td.tour_code
JOIN rcv_destination d 
    ON td.dest_code = d.dest_code
GROUP BY a.agent_code, a.first_name, a.last_name
HAVING SUM(d.price) > (
    SELECT AVG(total_sales)
    FROM (
        SELECT SUM(d2.price) AS total_sales
        FROM rcv_agent a2
        JOIN rcv_customer c2
            ON a2.agent_code = c2.agent_code
        JOIN rcv_tour_customer tc2 
            ON c2.customer_number = tc2.customer_number
        JOIN rcv_vacation_tour t2 
            ON tc2.tour_code = t2.tour_code
        JOIN rcv_tour_destination td2 
            ON t2.tour_code = td2.tour_code
        JOIN rcv_destination d2 
            ON td2.dest_code = d2.dest_code
        GROUP BY a2.agent_code, a2.first_name, a2.last_name
    )
)
ORDER BY agent_name;

CLEAR COLUMNS;


SPOOL off
