--------------------------------------------------
rem Q1 - Agents and Training
--------------------------------------------------

COLUMN first_name FORMAT A15;
COLUMN last_name FORMAT A15;
COLUMN training_desc FORMAT A25 HEADING 'Training Description';
COLUMN duration FORMAT A10 HEADING 'Hrs';
COLUMN expiry_date FORMAT A15 HEADING 'Expiry Date';

SELECT 
    a.first_name,
    a.last_name,
    SUBSTR(t.description, 1, 20) AS training_desc,
    t.duration || ' Hrs' AS duration,
    ADD_MONTHS(at.training_date, 60) AS expiry_date
FROM agents a
JOIN agent_training at ON a.agent_id = at.agent_id
JOIN training t ON at.training_id = t.training_id
ORDER BY a.last_name, a.first_name, t.description;

CLEAR COLUMNS;

--------------------------------------------------
rem Q2 - Tour Categorization
--------------------------------------------------

COLUMN country FORMAT A15;
COLUMN state FORMAT A10;
COLUMN city FORMAT A15;
COLUMN price FORMAT A12;
COLUMN category FORMAT A10;

SELECT 
    country,
    NVL(state, 'N/A') AS state,
    city,
    TO_CHAR(price, '$999.99') AS price,
    CASE 
        WHEN price <= 50 THEN 'Budget'
        WHEN price <= 100 THEN 'Regular'
        ELSE 'Premium'
    END AS category
FROM tours
ORDER BY country, state, city, category, price;

CLEAR COLUMNS;

--------------------------------------------------

spool off
