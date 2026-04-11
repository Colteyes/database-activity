-- =============================================
-- Description: Shows instructors teaching multiple courses
-- Author: Mahmood
-- Spool File: MM_InstructorTeachingLoad.lst
-- =============================================

SPOOL C:\cprg250s\SIS_prt6\MM_InstructorTeachingLoad.lst

SELECT 
    i.firstname || ' ' || i.lastname AS instructor_name,
    COUNT(ic.course_code) AS courses_taught
FROM sis_instructor i
JOIN sis_instructor_course ic
    ON i.instructor_id = ic.instructor_id
GROUP BY i.firstname, i.lastname
HAVING COUNT(ic.course_code) >= 2
ORDER BY courses_taught DESC;

SPOOL OFF;