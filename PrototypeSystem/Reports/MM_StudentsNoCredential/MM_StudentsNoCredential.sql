-- =============================================
-- Description: Shows students without any credentials
-- Author: Mahmood
-- Spool File: MM_StudentsNoCredential.lst
-- =============================================

SPOOL MM_StudentsNoCredential.lst

SELECT 
    s.firstname || ' ' || s.lastname AS student_name,
    UPPER(s.status) AS student_status,
    s.status_date
FROM sis_student s
LEFT OUTER JOIN sis_student_credential sc
    ON s.student_id = sc.student_id
WHERE sc.credential_id IS NULL
ORDER BY student_name;

SPOOL OFF;