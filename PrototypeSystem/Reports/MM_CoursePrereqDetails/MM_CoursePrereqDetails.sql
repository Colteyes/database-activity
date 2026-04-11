-- =============================================
-- Description: Shows courses and their prerequisite course names
-- Author: Mahmood
-- Spool File: MM_CoursePrereqDetails.lst
-- =============================================

SPOOL MM_CoursePrereqDetails.lst

SELECT 
    c.course_name,
    p.course_name AS prerequisite_course
FROM sis_course c
LEFT JOIN sis_course p
    ON c.prereq_course_code = p.course_code
WHERE c.prereq_course_code IS NOT NULL
ORDER BY c.course_name;

SPOOL OFF;