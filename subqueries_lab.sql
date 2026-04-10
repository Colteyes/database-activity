-- =====================================
-- QUESTION 2 (Lionel Messie)
-- =====================================

SET LINESIZE 150;

COLUMN FIRST_NAME FORMAT A15;
COLUMN LAST_NAME FORMAT A20;
COLUMN TOUR_DESCRIPTION FORMAT A30;
COLUMN DEST_DESCRIPTION FORMAT A60;

SELECT 
    c.first_name,
    c.last_name,
    t.tour_description,
    d.dest_description
FROM customers c
JOIN vacation_tours vt 
    ON c.customer_id = vt.customer_id
JOIN tours t 
    ON vt.tour_id = t.tour_id
JOIN destinations d 
    ON vt.destination_id = d.destination_id
WHERE vt.destination_id IN (
    SELECT vt2.destination_id
    FROM customers c2
    JOIN vacation_tours vt2 
        ON c2.customer_id = vt2.customer_id
    WHERE c2.first_name = 'Lionel'
      AND c2.last_name = 'Messie'
)
AND NOT (
    c.first_name = 'Lionel'
    AND c.last_name = 'Messie'
)
ORDER BY c.first_name, c.last_name;

CLEAR COLUMNS;
