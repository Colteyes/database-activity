-- REPORT 1: Student GPA by Credential

SPOOL C:\cprg250s\SIS_prt6\GPACREDS_Out.txt

COLUMN firstname FORMAT A10;
COLUMN lastname FORMAT A10;
COLUMN name FORMAT A25;
COLUMN avg_gpa FORMAT 9.99;

SELECT 
    s.firstname,
    s.lastname,
    c.name,
    AVG(sc.gpa) AS avg_gpa   
FROM sis_student s
INNER JOIN sis_student_credential sc  
    ON s.student_id = sc.student_id
INNER JOIN sis_credential c
    ON sc.credential_id = c.credential_id
WHERE 
    sc.credential_status = 'ACTIVE'  
    AND sc.gpa > 3.0                  
GROUP BY 
    s.firstname, s.lastname, c.name
HAVING 
    AVG(sc.gpa) > 3.2               
ORDER BY 
    avg_gpa DESC;             


SPOOL OFF      