-- =============================================
-- Description: Displays students with GPA higher than the average GPA
-- Author: Dung
-- Spool File: VD_HighGPAStudentsReport.lst
-- =============================================

SPOOL VD_HighGPAStudentsReport.lst

SELECT 
    s.firstname || ' ' || s.lastname AS student_name,
    sc.gpa,
    UPPER(s.status) AS student_status
FROM sis_student s
INNER JOIN sis_student_credential sc
    ON s.student_id = sc.student_id
WHERE sc.gpa > (
    SELECT AVG(gpa) 
    FROM sis_student_credential
)
AND sc.gpa IS NOT NULL
ORDER BY sc.gpa DESC;

SPOOL OFF;
