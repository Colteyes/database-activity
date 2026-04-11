-- =============================================
-- Description: Shows the number of students enrolled in each course
-- Author: Dung
-- Spool File: VD_CourseEnrollmentSummaryReport.lst
-- =============================================

SPOOL VD_CourseEnrollmentSummaryReport.lst

SELECT 
    c.course_name,
    COUNT(scr.student_id) AS total_students
FROM sis_course c
LEFT OUTER JOIN sis_student_course_record scr
    ON c.course_code = scr.course_code
GROUP BY c.course_name
HAVING COUNT(scr.student_id) > 0
ORDER BY total_students DESC;

SPOOL OFF;
