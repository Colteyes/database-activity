-- =============================================
-- Description: Shows instructors teaching multiple courses
-- Author: Mahmood
-- Spool File: MM_InstructorTeachingLoad.lst
-- =============================================

SPOOL MM_InstructorTeachingLoad.lst

SELECT 
    i.firstname || ' ' || i.lastname AS instructor_name,
    COUNT(ic.crn) AS courses_taught
FROM sis_instructor i
JOIN sis_instructor_course ic
    ON i.instructorid = ic.instructorid
GROUP BY i.firstname, i.lastname
HAVING COUNT(ic.crn) >= 2
ORDER BY courses_taught DESC;

SPOOL OFF;