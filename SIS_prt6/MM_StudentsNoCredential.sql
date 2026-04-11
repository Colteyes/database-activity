-- =============================================
-- Description: Shows students without any credentials
-- Author: Mahmood
-- Spool File: MM_StudentsNoCredential.lst
-- =============================================

SPOOL C:\cprg250s\SIS_prt6\MM_StudentsNoCredential.lst

SELECT 
    s.firstname || ' ' || s.lastname AS student_name,
    UPPER(s.status) AS student_status,
    s.enrolldate
FROM sis_student s
LEFT OUTER JOIN sis_student_credential sc
    ON s.student_id = sc.student_id
WHERE sc.credential IS NULL
ORDER BY student_name;

SPOOL OFF;