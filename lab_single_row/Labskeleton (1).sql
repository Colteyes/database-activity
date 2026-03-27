SPOOL C:\cprg250s\Lab_Single_Row\lab_spool_output.txt
rem Lab Unit 10-11 Simple SELECT and Sorting 
set echo off
set linesize 100
set pagesize 100
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
    SUBSTR(t.training_description, 1, 20) AS training_desc,
    
    ADD_MONTHS(at.date_completed, 60) AS expiry_date
FROM rcv_agent a
JOIN rcv_agent_training at ON a.agent_id = at.agent_id
JOIN rcv_training t ON at.training_code = t.training_code
ORDER BY a.last_name, a.first_name, t.training_description;

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
    CASE 
        WHEN price <= 50 THEN 'Budget'
        WHEN price <= 100 THEN 'Regular'
        ELSE 'Premium'
    END AS category,
    TO_CHAR(price, '$999.99') AS price    
FROM rcv_destination
ORDER BY country, state, city, category, price;

CLEAR COLUMNS;

--------------------------------------------------

spool off
